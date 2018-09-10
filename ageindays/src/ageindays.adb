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

  function GetDaysBetween(birth_day : in Day_Number; birth_month : in Month_Number; birth_year : in Year_Number;
                          today_day : in Day_Number; today_month : in Month_Number; today_year : in Year_Number) return Integer is
  begin
    --today_day - birth_day;
    return 0;
  end GetDaysBetween;

  function PreviousMonth(month : in Month_Number) return Month_Number is
  begin
    return (if month = 1 then 12 else month - 1);
  end PreviousMonth;

  procedure GetAgeDifference(birth_day : in Day_Number; birth_month : in Month_Number; birth_year : in Year_Number;
                            today_day : in Day_Number; today_month : in Month_Number; today_year : in Year_Number;
                            DaysOld : out DifferenceDays; MonthsOld : out DifferenceMonths; YearsOld : out DifferenceYears) is
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
  end GetAgeDifference;

  type InputStatus is (Good, Absurd);

  function GetBirthDay(input : in String; day : out Day_Number; month : out Month_Number; year : out Year_Number) return InputStatus is
    unboundedMonths : String_Array := ToUnboundedStringArray(Months);
    Re : constant Pattern_Matcher := Compile("(^(1|2|3)?\d)(th|nd|rd)? (of )?(" & StringJoin("|", unboundedMonths) & ") ((19|20)\d{2})$");
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
      if YearInteger < 1901 or YearInteger > 2018 then
        return Absurd;
      end if;
      year := Year_Number(YearInteger);
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
      Result := GetBirthDay(Input, BirthDay, BirthMonth, BirthYear); --TODO pass today's date so that dates in the future can be rejected
      if Result = Absurd then
        Put_Line("Don't be absurd. Tell me your real birthday");
      else
        Put_Line("Birthday: " & IntegerToString(BirthDay) & '/' & IntegerToString(BirthMonth) & '/' & IntegerToString(BirthYear));
        declare
          YearsOld : DifferenceYears;
          MonthsOld : DifferenceMonths;
          DaysOld : DifferenceDays;
        begin
          GetAgeDifference(BirthDay, BirthMonth, BirthYear, Today_Day, Today_Month, Today_Year, DaysOld, MonthsOld, YearsOld);
          Put_Line("You are" & YearsOld'Image & " years," & MonthsOld'Image & " months and" & DaysOld'Image & " days old.");
        end;
      end if;
    end;
  end loop;
end Ageindays;
