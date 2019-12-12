pragma Ada_2012;

with Ada.Text_IO;            use Ada.Text_IO;
with Ada.Calendar;           use Ada.Calendar;
with StringUtil;             use StringUtil;
with AgeCalculator;          use AgeCalculator;
with DateInput;              use DateInput;
with Ada.Strings.Bounded;

procedure Ageindays is
  Today_Day : Day_Number;
  Today_Month : Month_Number;
  Today_Year : Year_Number;
  package FooBounded is new Ada.Strings.Bounded;
  type FooString is new FooBOunded.Bounded_String;
begin
  declare
    TodayTime : Time := Clock;
    Today_Seconds : Day_Duration;
  begin
    Split(TodayTime, Today_Year, Today_Month, Today_Day, Today_Seconds);
  end;
  Put_Line("Today is " & IntegerToString(Integer(Today_Day)) & '/' 
                       & IntegerToString(Today_Month) & '/' & IntegerToString(Today_Year));

<<<<<<< HEAD:file.txt
Hello world
=======
Goodbye
>>>>>>> 77976da35a11db4580b80ae27e8d65caf5208086:file.txt
  Put_Line("What is your birthday?");
  Put_Line("Supported formats by example:");
  Put_Line("-24th of September 1992");
  Put_Line("-24 of September 1992");
  Put_Line("-24 September 1992");
  Put_Line("-September 24th, 1992");
  Put_Line("-September 24th 1992");
  Put_Line("-September 24, 1992");
  Put_Line("-September 24 1992");
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
      Result := GetBirthDay(Input, BirthDay, BirthMonth, BirthYear, 
                                   Today_Day, Today_Month, Today_Year);
      if Result = Absurd then
        Put_Line("Don't be absurd. Tell me your real birthday");
      else
        Put_Line("Birthday: " & IntegerToString(BirthDay) & '/' 
                              & IntegerToString(BirthMonth) & '/' & IntegerToString(BirthYear));
        declare
          YearsOld : DifferenceYears;
          MonthsOld : DifferenceMonths;
          DaysOld : DifferenceDays;
          TotalDaysOld : NumberOfDaysOld;
        begin
          GetAgeDifference(BirthDay, BirthMonth, BirthYear, Today_Day, Today_Month, Today_Year,
                           DaysOld, MonthsOld, YearsOld, TotalDaysOld);
          Put_Line("You are" & YearsOld'Image & " years," & MonthsOld'Image 
                             & " months and" & DaysOld'Image & " days old.");
          Put_Line("Total age in days:" & TotalDaysOld'Image);
        end;
      end if;
    end;
  end loop;
end Ageindays;
