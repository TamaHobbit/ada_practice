with Ada.Text_IO;            use Ada.Text_IO;
with GNAT.Regpat;            use GNAT.Regpat;
with Ada.Strings.Bounded;    use Ada.Strings.Bounded;
with Ada.Strings.Unbounded;  use Ada.Strings.unbounded;
with StringUtil;             use StringUtil;
with Ada.Calendar;           use Ada.Calendar;

procedure Ageindays is

  package Month_String is new Ada.Strings.Bounded.Generic_Bounded_Length(9);

  -- Integer'Image returns a space followed by a string representing the number
  -- IntegerToString returns just the string representing the number
  function IntegerToString(number : in Integer) return String is
    image : String := number'Image;
  begin
    return image(2..image'Length);
  end IntegerToString;

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
                                  Month_String.To_Bounded_String("January"),
                                  Month_String.To_Bounded_String("February"),
                                  Month_String.To_Bounded_String("March"),
                                  Month_String.To_Bounded_String("April"),
                                  Month_String.To_Bounded_String("May"),
                                  Month_String.To_Bounded_String("June"),
                                  Month_String.To_Bounded_String("July"),
                                  Month_String.To_Bounded_String("August"),
                                  Month_String.To_Bounded_String("September"),
                                  Month_String.To_Bounded_String("October"),
                                  Month_String.To_Bounded_String("November"),
                                  Month_String.To_Bounded_String("December")
                                 );

  function GetMonthIndex(monthName : in Month_String.Bounded_String) return Month_Number is
  begin
    for i in Month_Number'Range loop
      if Month_String."="(monthName, Months(i)) then
        return i;
      end if;
    end loop;
    raise Program_Error;
  end GetMonthIndex;

  function IsLeapYear(year : Year_Number) return Boolean is
  begin
    return year mod 4 = 0 and (year mod 100 /= 0 or year mod 400 = 0);
  end IsLeapYear;

  function DaysInMonth(month : in Month_Number; year : in Year_Number) return Day_Number is
  begin
    if month = 2 then
      return (if IsLeapYear(year) then 29 else 28);
    end if;
    if month <= 7 then
      return (30 + (month mod 2));
    end if;
    return (31 - (month mod 2));
  end DaysInMonth;

  type DifferenceYears is range Year_Number'First - Year_Number'Last..Year_Number'Last - Year_Number'First;
  type DifferenceMonths is range Month_Number'First - Month_Number'Last..Month_Number'Last - Month_Number'First;
  type DifferenceDays is range Day_Number'First - Day_Number'Last..Day_Number'Last - Day_Number'First;
  type NumberOfDaysOld is range 0..(366*(Year_Number'Last-Year_Number'First + 1));

  function PreviousMonth(month : in Month_Number) return Month_Number is
  begin
    return (if month = 1 then 12 else month - 1);
  end PreviousMonth;

  function NextMonth(month : in Month_Number) return Month_Number is
  begin
    return (if month = 12 then 1 else month + 1);
  end NextMonth;

  function WrapMonth(month : in Integer) return Month_Number is
  begin
    return ((month - 1) mod 12) + 1;
  end WrapMonth;

  procedure GetAgeDifference(birth_day : in Day_Number; birth_month : in Month_Number; birth_year : in Year_Number;
                            today_day : in Day_Number; today_month : in Month_Number; today_year : in Year_Number;
                            DaysOld : out DifferenceDays; MonthsOld : out DifferenceMonths; YearsOld : out DifferenceYears;
                            TotalDaysOld : out NumberOfDaysOld) is
  begin
    YearsOld := DifferenceYears(today_year - birth_year);
    MonthsOld := DifferenceMonths(today_month - birth_month);
    DaysOld := DifferenceDays(today_day - birth_day);
    if DaysOld < 0 then
      MonthsOld := MonthsOld - 1;
      DaysOld := DifferenceDays(Integer(DaysOld) + Integer(DaysInMonth(PreviousMonth(birth_month), birth_year)));
    end if;
    if MonthsOld < 0 then
      YearsOld := YearsOld - 1;
      MonthsOld := MonthsOld + 12;
    end if;

    declare
      BirthDayBeforeLeapDay : Boolean := birth_month <= 2;
    begin
      TotalDaysOld := 0;
      for year in birth_year..Year_Number(Integer(birth_year) + Integer(YearsOld) - 1) loop
        declare
          LeapDayYear : Year_Number := (if BirthDayBeforeLeapDay then year else year + 1);
          DaysInYear : NumberOfDaysOld := (if IsLeapYear(LeapDayYear) then 366 else 365);
        begin
          TotalDaysOld := TotalDaysOld + DaysInYear;
        end;
      end loop;
    end;

    if MonthsOld = 0 and today_day >= birth_day then
      TotalDaysOld := TotalDaysOld + NumberOfDaysOld(today_day - birth_day);
    else
      TotalDaysOld := TotalDaysOld + NumberOfDaysOld(DaysInMonth(birth_month, birth_year) - birth_day);
      declare
        beginMonth : Month_Number := NextMonth(birth_month);
        endMonth : Month_Number := PreviousMonth(today_month);
        unwrappedEndMonth : Integer := (if today_month >= beginMonth then endMonth else endMonth + 12);
      begin
        for month_unwrapped in beginMonth..unwrappedEndMonth loop
          declare
            month : Month_Number := Month_Number(WrapMonth(month_unwrapped));
            yearOfMonth : Year_Number := (if month > today_month then today_year - 1 else today_year);
          begin
            TotalDaysOld := TotalDaysOld + NumberOfDaysOld(DaysInMonth(month, yearOfMonth));
          end;
        end loop;
      end;
      TotalDaysOld := TotalDaysOld + NumberOfDaysOld(today_day);
    end if;
  end GetAgeDifference;

  type InputStatus is (Good, Absurd);

  function GetBirthDay(input : in String; day : out Day_Number; month : out Month_Number; year : out Year_Number;
                       today_day : in Day_Number; today_month : in Month_Number; today_year : in Year_Number) return InputStatus is
    unboundedMonths : String_Array := ToUnboundedStringArray(Months);
    Re : constant Pattern_Matcher := Compile("(^(1|2|3)?\d)(st|th|nd|rd)? (of )?(" & StringJoin("|", unboundedMonths) & ") ((19|20)\d{2})$");
    Matches : Match_Array (0..6);
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
      YearMatch : GNAT.Regpat.Match_Location := Matches(6);
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
