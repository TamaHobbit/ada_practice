--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into AgeCalculator.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with System.Assertions;

--  begin read only
--  id:2.2/00/
--
--  This section can be used to add with clauses if necessary.
--
--  end read only

with StringUtil; use StringUtil;
with GNAT.Source_Info;

--  begin read only
--  end read only
package body AgeCalculator.Test_Data.Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

--  begin read only
--  end read only

--  begin read only
   procedure Test_DaysInMonth (Gnattest_T : in out Test);
   procedure Test_DaysInMonth_164afd (Gnattest_T : in out Test) renames Test_DaysInMonth;
--  id:2.2/164afd8f79290564/DaysInMonth/1/0/
   procedure Test_DaysInMonth (Gnattest_T : in out Test) is
   --  agecalculator.ads:10:3:DaysInMonth
--  end read only
     Result : Boolean;
   begin

     Result := Assert(DaysInMonth(1, 2018) = 31, "January has 31 days");
     Result := Assert(DaysInMonth(2, 1999) = 28, "February has 28 days in a common year");
     Result := Assert(DaysInMonth(2, 2004) = 29, "February has 29 days in a leap year");
     Result := Assert(DaysInMonth(3, 2018) = 31, "March has 31 days");
     Result := Assert(DaysInMonth(4, 2018) = 30, "April has 30 days");
     Result := Assert(DaysInMonth(5, 2018) = 31, "May has 31 days");
     Result := Assert(DaysInMonth(6, 2018) = 30, "June has 30 days");
     Result := Assert(DaysInMonth(7, 2018) = 31, "July has 31 days");
     Result := Assert(DaysInMonth(8, 2018) = 31, "August has 31 days");
     Result := Assert(DaysInMonth(9, 2018) = 30, "September has 30 days");
     Result := Assert(DaysInMonth(10, 2018) = 31, "October has 31 days");
     Result := Assert(DaysInMonth(11, 2018) = 30, "November has 30 days");
     Result := Assert(DaysInMonth(12, 2018) = 31, "December has 31 days");

--  begin read only
   end Test_DaysInMonth;
--  end read only


--  begin read only
   procedure Test_GetAgeDifference (Gnattest_T : in out Test);
   procedure Test_GetAgeDifference_f0660d (Gnattest_T : in out Test) renames Test_GetAgeDifference;
--  id:2.2/f0660ded7571d70e/GetAgeDifference/1/0/
   procedure Test_GetAgeDifference (Gnattest_T : in out Test) is
   --  agecalculator.ads:12:3:GetAgeDifference
--  end read only
     procedure TestDateSpanLength(birth_day : in Day_Number; birth_month : in Month_Number;
                                  birth_year : in Year_Number; today_day : in Day_Number;
                                  today_month : in Month_Number; today_year : in Year_Number;
                                  expectedDays : NumberOfDaysOld;
                                  Line : Natural := GNAT.Source_Info.Line) is
       DaysOld : DifferenceDays;
       MonthsOld : DifferenceMonths;
       YearsOld : DifferenceYears;
       TotalDaysOld : NumberOfDaysOld;
       Result : Boolean;
     begin
       GetAgeDifference(birth_day, birth_month, birth_year, today_day, today_month, today_year,
                         DaysOld, MonthsOld, YearsOld, TotalDaysOld);
       Result := Assert(TotalDaysOld = expectedDays, 
                         IntegerToString(birth_day) & "-" & IntegerToString(birth_month) & "-" &
                         IntegerToString(birth_year) & ".." & IntegerToString(today_day) & "-" &
                         IntegerToString(today_month) & "-" & IntegerToString(today_year) &
                         " Expected:" & IntegerToString(expectedDays) & " Actual:" &
                         IntegerToString(TotalDaysOld), Line => Line);
     end TestDateSpanLength;
   begin

     TestDateSpanLength(3, 3, 2016, 3, 3, 2016, 0);
     TestDateSpanLength(2, 3, 2016, 3, 3, 2016, 1);
     TestDateSpanLength(1, 3, 2016, 3, 3, 2016, 2);
     TestDateSpanLength(29, 2, 2016, 3, 3, 2016, 3);
     TestDateSpanLength(28, 2, 2016, 3, 3, 2016, 4);

     TestDateSpanLength(28, 2, 2017, 3, 3, 2017, 3);

     TestDateSpanLength(5, 2, 2016, 5, 1, 2017, 335);
     TestDateSpanLength(5, 2, 2017, 5, 1, 2018, 334);

     TestDateSpanLength(5, 1, 2017, 5, 2, 2017, 31);
     TestDateSpanLength(5, 12, 2017, 5, 1, 2018, 31);
     TestDateSpanLength(5, 12, 2016, 5, 1, 2018, 396);
     TestDateSpanLength(5, 12, 2015, 5, 1, 2017, 397);

     TestDateSpanLength(5, 1, 2015, 10, 1, 2015, 5);
     TestDateSpanLength(5, 2, 2015, 10, 2, 2015, 5);
     TestDateSpanLength(5, 3, 2015, 10, 3, 2015, 5);
     TestDateSpanLength(5, 4, 2015, 10, 4, 2015, 5);
     TestDateSpanLength(5, 5, 2015, 10, 5, 2015, 5);
     TestDateSpanLength(5, 6, 2015, 10, 6, 2015, 5);
     TestDateSpanLength(5, 7, 2015, 10, 7, 2015, 5);
     TestDateSpanLength(5, 8, 2015, 10, 8, 2015, 5);
     TestDateSpanLength(5, 9, 2015, 10, 9, 2015, 5);
     TestDateSpanLength(5, 10, 2015, 10, 10, 2015, 5);
     TestDateSpanLength(5, 11, 2015, 10, 11, 2015, 5);
     TestDateSpanLength(5, 12, 2015, 10, 12, 2015, 5);

     TestDateSpanLength(5, 1, 2015, 10, 2, 2015, 36);
     TestDateSpanLength(5, 2, 2015, 10, 3, 2015, 33);
     TestDateSpanLength(5, 3, 2015, 10, 4, 2015, 36);
     TestDateSpanLength(5, 4, 2015, 10, 5, 2015, 35);
     TestDateSpanLength(5, 5, 2015, 10, 6, 2015, 36);
     TestDateSpanLength(5, 6, 2015, 10, 7, 2015, 35);
     TestDateSpanLength(5, 7, 2015, 10, 8, 2015, 36);
     TestDateSpanLength(5, 8, 2015, 10, 9, 2015, 36);
     TestDateSpanLength(5, 9, 2015, 10, 10, 2015, 35);
     TestDateSpanLength(5, 10, 2015, 10, 11, 2015, 36);
     TestDateSpanLength(5, 11, 2015, 10, 12, 2015, 35);
     TestDateSpanLength(5, 12, 2015, 10, 1, 2016, 36);

     TestDateSpanLength(5, 1, 2015, 10, 3, 2015, 64);
     TestDateSpanLength(5, 2, 2015, 10, 4, 2015, 64);
     TestDateSpanLength(5, 3, 2015, 10, 5, 2015, 66);
     TestDateSpanLength(5, 4, 2015, 10, 6, 2015, 66);
     TestDateSpanLength(5, 5, 2015, 10, 7, 2015, 66);
     TestDateSpanLength(5, 6, 2015, 10, 8, 2015, 66);
     TestDateSpanLength(5, 7, 2015, 10, 9, 2015, 67);
     TestDateSpanLength(5, 8, 2015, 10, 10, 2015, 66);
     TestDateSpanLength(5, 9, 2015, 10, 11, 2015, 66);
     TestDateSpanLength(5, 10, 2015, 10, 12, 2015, 66);
     TestDateSpanLength(5, 11, 2015, 10, 1, 2016, 66);
     TestDateSpanLength(5, 12, 2015, 10, 2, 2016, 67);

     TestDateSpanLength(24, 9, 1992, 10, 9, 2018, 9482);

     TestDateSpanLength(9, 9, 2018, 10, 9, 2018, 1);
     TestDateSpanLength(8, 8, 2018, 10, 9, 2018, 33);

     TestDateSpanLength(10, 9, 2017, 10, 9, 2018, 365);
     TestDateSpanLength(11, 9, 2017, 10, 9, 2018, 364);

--  begin read only
   end Test_GetAgeDifference;
--  end read only

--  begin read only
--  id:2.2/02/
--
--  This section can be used to add elaboration code for the global state.
--
begin
--  end read only
   null;
--  begin read only
--  end read only
end AgeCalculator.Test_Data.Tests;
