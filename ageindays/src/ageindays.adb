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
  begin
     declare
        image : String := number'Image;
     begin
        return image(2..image'Length);
     end;
  end IntegerToString;

  type Month_Index is range 1..12;
  type Month_String_Array is array (Month_Index'Range) of Month_String.Bounded_String;

  function ToUnboundedStringArray(months : in Month_String_Array) return String_Array is
  begin
    declare
      Result : String_Array(Integer(Month_Index'First)..Integer(Month_Index'Last));
    begin
      for i in Month_Index'Range loop
        Result(Integer(i)) := To_Unbounded_String(Month_String.To_String(months(i)));
      end loop;
      return Result;
    end;
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

  function GetMonthIndex(monthName : in Month_String.Bounded_String) return Month_Index is
  begin
    for i in Month_Index'Range loop
      if Month_String."="(monthName, Months(i)) then
        return i;
      end if;
    end loop;
    raise Program_Error;
  end GetMonthIndex;

  function IsLeapYear(year : Ada.Calendar.Year_Number) return Boolean is
  begin
    return year mod 4 = 0 and (year mod 100 /= 0 or year mod 400 = 0);
  end IsLeapYear;

  Today_Day : Ada.Calendar.Day_Number;
  Today_Month : Ada.Calendar.Month_Number;
  Today_Year : Ada.Calendar.Year_Number;
begin
  declare
    TodayTime : Ada.Calendar.Time := Ada.Calendar.Clock;
    Today_Seconds : Ada.Calendar.Day_Duration;
  begin
    Ada.Calendar.Split(TodayTime, Today_Year, Today_Month, Today_Day, Today_Seconds);
  end;
  Put_Line("Today is " & IntegerToString(Integer(Today_Day)) & '/' & IntegerToString(Today_Month) & '/' & IntegerToString(Today_Year));

  Put_Line("What is your birthday?");
  Put_Line("Supported formats by example:");
  Put_Line("24th of September 1992");
  declare
    unboundedMonths : String_Array := ToUnboundedStringArray(Months);
    Re : constant Pattern_Matcher := Compile("(^(1|2)?\d)(th|nd|rd) of (" & StringJoin("|", unboundedMonths) & ") ((19|20)\d{2})$");
  begin
    loop
      declare
        Input : constant String := Get_Line;
        Matches : Match_Array (0..5);
        BirthDay : Ada.Calendar.Day_Number;
        BirthMonth : Ada.Calendar.Month_Number;
        BirthYear : Ada.Calendar.Year_Number;

        function DaysInMonth(month : in Integer; year : in Integer) return Integer is
        begin
          if month = 2 then
            return (if IsLeapYear(year) then 29 else 28);
          end if;
          if month <= 7 then
            return (30 + (month mod 2));
          end if;
          return (31 - (month mod 2));
        end DaysInMonth;
      begin
        exit when Input = "";
        Match(Re, Input, Matches);
        if Matches(0) = No_Match then
          Put_Line("No match");
        else
          BirthDay := Integer'Value(Input(Matches(1).First .. Matches(1).Last));
          declare
            MonthString : Month_String.Bounded_String := Month_String.To_Bounded_String(Input(Matches(4).First .. Matches(4).Last)); 
          begin
            BirthMonth := Integer(GetMonthIndex(MonthString));
          end;
          
          BirthYear := Integer'Value(Input(Matches(5).First .. Matches(5).Last));

          if BirthYear < 1901 then
            Put_Line("Don't be absurd. Tell me your real birthday");
          else
            Put_Line("Birthday: " & IntegerToString(BirthDay) & '/' & IntegerToString(BirthMonth) & '/' & IntegerToString(BirthYear));
            declare
              YearsOld : Integer := Today_Year - BirthYear;
              MonthsOld : Integer := Today_Month - BirthMonth;
              DaysOld : Integer := Today_Day - BirthDay;

              function PreviousMonth(month : in Integer) return Integer is
              begin
                return (if month = 1 then 12 else month - 1);
              end PreviousMonth;

            begin
              Put_Line(PreviousMonth(1)'Image);
              if DaysOld < 0 then
                MonthsOld := MonthsOld - 1;
                DaysOld := DaysOld + DaysInMonth(PreviousMonth(BirthMonth), BirthYear);
              end if;
              if MonthsOld < 0 then
                YearsOld := YearsOld - 1;
                MonthsOld := MonthsOld + 12;
              end if;
              Put_Line("You are" & YearsOld'Image & " years," & MonthsOld'Image & " months and" & DaysOld'Image & " days old.");
            end;
          end if;
        end if;
      end;
    end loop;
  end;
end Ageindays;
