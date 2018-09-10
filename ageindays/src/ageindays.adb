with Ada.Text_IO;            use Ada.Text_IO;
with GNAT.Regpat;            use GNAT.Regpat;
with Ada.Strings.Bounded;    use Ada.Strings.Bounded;
with Ada.Strings.Unbounded;  use Ada.Strings.unbounded;
with Ada.Calendar;           use Ada.Calendar;
with StringUtil;             use StringUtil;
with AgeCalculator;          use AgeCalculator;

procedure Ageindays is

  package Month_String is new Ada.Strings.Bounded.Generic_Bounded_Length(13);

  type Month_String_Array is array (Month_Number'Range) of Month_String.Bounded_String;

  function ToUnboundedStringArray(months : in Month_String_Array) return String_Array is
    Result : String_Array(Integer(Month_Number'First)..Integer(Month_Number'Last));
  begin
    for i in Month_Number'Range loop
      Result(Integer(i)) := To_Unbounded_String(Month_String.To_String(months(i)));
    end loop;
    return Result;
  end ToUnboundedStringArray;

  Months : Month_String_Array := (
                                  Month_String.To_Bounded_String("(J|j)anuary"),
                                  Month_String.To_Bounded_String("(F|f)ebruary"),
                                  Month_String.To_Bounded_String("(M|m)arch"),
                                  Month_String.To_Bounded_String("(A|a)pril"),
                                  Month_String.To_Bounded_String("(M|m)ay"),
                                  Month_String.To_Bounded_String("(J|j)une"),
                                  Month_String.To_Bounded_String("(J|j)uly"),
                                  Month_String.To_Bounded_String("(A|a)ugust"),
                                  Month_String.To_Bounded_String("(S|s)eptember"),
                                  Month_String.To_Bounded_String("(O|o)ctober"),
                                  Month_String.To_Bounded_String("(N|n)ovember"),
                                  Month_String.To_Bounded_String("(D|d)ecember")
                                 );

  function GetMonthIndex(monthName : in Month_String.Bounded_String) return Month_Number is
  begin
    for i in Month_Number'Range loop
      declare
        MonthRegex : constant Pattern_Matcher := Compile(Month_String.To_String(Months(i)));
        Matches : Match_Array (0..1);
      begin
        Match(MonthRegex, Month_String.To_String(monthName), Matches);
        if Matches(0) /= No_Match then
          return i;
        end if;
      end;
    end loop;
    raise Program_Error;
  end GetMonthIndex;

  type InputStatus is (Good, Absurd);

  function GetBirthDay(input : in String; day : out Day_Number; month : out Month_Number; year : out Year_Number;
                       today_day : in Day_Number; today_month : in Month_Number; today_year : in Year_Number) return InputStatus is
    unboundedMonths : String_Array := ToUnboundedStringArray(Months);
    Re : constant Pattern_Matcher := Compile("(^(1|2|3)?\d)(st|th|nd|rd)? (of )?(" & StringJoin("|", unboundedMonths) & ") ((19|20)\d{2})$");
    Matches : Match_Array (0..18);
  begin
    Match(Re, Input, Matches);

    if Matches(0) = No_Match then
      return Absurd;
    end if;

    declare
      MonthMatch : GNAT.Regpat.Match_Location := Matches(5);
      MonthString : Month_String.Bounded_String := Month_String.To_Bounded_String(Input(MonthMatch.First .. MonthMatch.Last));
    begin
      month := Integer(GetMonthIndex(MonthString));
    end;

    declare
      type YearInput is range 1900..2099;
      YearMatch : GNAT.Regpat.Match_Location := Matches(18);
      YearInteger : YearInput := YearInput'Value(Input(YearMatch.First .. YearMatch.Last));
    begin
      if YearInteger < 1901 then
        return Absurd;
      end if;
      year := Year_Number(YearInteger);
      if year > today_year then
        return Absurd;
      end if;
    end;

    declare
      DayInteger : Integer range 0..39;
      DayMatch : GNAT.Regpat.Match_Location := Matches(1);
      DaysInBirthMonth : constant Day_Number := DaysInMonth(month, year);
    begin
      DayInteger := Integer'Value(Input(DayMatch.First .. DayMatch.Last));
      if DayInteger < Day_Number'First or DayInteger > DaysInBirthMonth then
        return Absurd;
      end if;
      day := Day_Number(DayInteger);

      if year = today_year then
        if month > today_month or (month = today_month and day > today_day) then
          return Absurd;
        end if;
      end if;
      return Good;
    end;
  end GetBirthDay;

  Today_Day : Day_Number;
  Today_Month : Month_Number;
  Today_Year : Year_Number;
begin
  declare
    TodayTime : Time := Clock;
    Today_Seconds : Day_Duration;
  begin
    Split(TodayTime, Today_Year, Today_Month, Today_Day, Today_Seconds);
  end;
  Put_Line("Today is " & IntegerToString(Integer(Today_Day)) & '/' & IntegerToString(Today_Month) & '/' & IntegerToString(Today_Year));

  Put_Line("What is your birthday?");
  Put_Line("Supported formats by example:");
  Put_Line("-24th of September 1992");
  Put_Line("-24 of September 1992");
  Put_Line("-24 September 1992");
  loop
    Put("> ");
    declare
      Input : constant String := Get_Line;
      BirthDay : Day_Number;
      BirthMonth : Month_Number;
      BirthYear : Year_Number;
      Result : InputStatus;
    begin
      exit when Input = "";
      Result := GetBirthDay(Input, BirthDay, BirthMonth, BirthYear, Today_Day, Today_Month, Today_Year);
      if Result = Absurd then
        Put_Line("Don't be absurd. Tell me your real birthday");
      else
        Put_Line("Birthday: " & IntegerToString(BirthDay) & '/' & IntegerToString(BirthMonth) & '/' & IntegerToString(BirthYear));
        declare
          YearsOld : DifferenceYears;
          MonthsOld : DifferenceMonths;
          DaysOld : DifferenceDays;
          TotalDaysOld : NumberOfDaysOld;
        begin
          GetAgeDifference(BirthDay, BirthMonth, BirthYear, Today_Day, Today_Month, Today_Year, DaysOld, MonthsOld, YearsOld, TotalDaysOld);
          Put_Line("You are" & YearsOld'Image & " years," & MonthsOld'Image & " months and" & DaysOld'Image & " days old.");
          Put_Line("Total age in days:" & TotalDaysOld'Image);
        end;
      end if;
    end;
  end loop;
end Ageindays;
