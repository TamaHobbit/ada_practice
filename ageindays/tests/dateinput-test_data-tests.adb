--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into DateInput.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with System.Assertions;

--  begin read only
--  id:2.2/00/
--
--  This section can be used to add with clauses if necessary.
--
--  end read only

with GNAT.Source_Info;

--  begin read only
--  end read only
package body DateInput.Test_Data.Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

--  begin read only
--  end read only

--  begin read only
   procedure Test_GetDate (Gnattest_T : in out Test);
   procedure Test_GetDate_cc90ae (Gnattest_T : in out Test) renames Test_GetDate;
--  id:2.2/cc90ae018d851745/GetDate/1/0/
   procedure Test_GetDate (Gnattest_T : in out Test) is
   --  dateinput.ads:12:3:GetDate
--  end read only
     procedure CheckDate(input : in String; expected : in String;
                          Line : Natural := GNAT.Source_Info.Line) is
       day : Day_Number;
       month : Month_Number;
       year : Year_Number;
       result : InputStatus;
       garbage : Boolean;
     begin
       result := GetDate(input, day, month, year);
       garbage := Assert(result = Good, "No parse for: " & input, Line => Line);
       declare
         parsedResult : String := IntegerToString(day) & "/" & 
                                  IntegerToString(month) & "/" &
                                  IntegerToString(year);
       begin
         Assert(parsedResult = expected, "Parsed: " & input &
                                         " Expected: " & expected & 
                                         " Actual: " & parsedResult, Line => Line);
       end;
     end CheckDate;

     procedure CheckInvalid(input : in String; Line : Natural := GNAT.Source_Info.Line) is
       day : Day_Number;
       month : Month_Number;
       year : Year_Number;
       result : InputStatus;
       garbage : Boolean;
     begin
       result := GetDate(input, day, month, year);
       garbage := Assert(result = Absurd, "Parsed: " & input & " Expected: no parse", Line => Line);
     end CheckInvalid;
   begin
     CheckDate("24th of September 1992", "24/9/1992");
     CheckDate("7th of July 1901", "7/7/1901");
     CheckDate("March 4th 1956", "4/3/1956");
     CheckDate("24th of September 1992", "24/9/1992");
     CheckDate("1 of September 1992", "1/9/1992");
     CheckDate("1 September 1992", "1/9/1992");
     CheckDate("29 February 2004", "29/2/2004");
     CheckDate("1st of January 1901", "1/1/1901");

     CheckInvalid("31st of December 1900");
     CheckInvalid("29 February 2003");
     CheckInvalid("31 April 2003");
     CheckInvalid("-1 April 2003");
     CheckInvalid("01 April 2003");
     CheckInvalid("1sth of April 2003");
     CheckInvalid("31st of December 2003 was a snowy cold night when I realised my life was vain");
--  begin read only
   end Test_GetDate;
--  end read only


--  begin read only
   procedure Test_GetBirthDay (Gnattest_T : in out Test);
   procedure Test_GetBirthDay_e47e4e (Gnattest_T : in out Test) renames Test_GetBirthDay;
--  id:2.2/e47e4e476d7aff77/GetBirthDay/1/0/
   procedure Test_GetBirthDay (Gnattest_T : in out Test) is
   --  dateinput.ads:15:3:GetBirthDay
--  end read only
     procedure CheckBirthDay(input : in String; today_day : in Day_Number; 
                             today_month : in Month_Number; today_year : in Year_Number;
                             expected : in String;
                             Line : Natural := GNAT.Source_Info.Line) is
       day : Day_Number;
       month : Month_Number;
       year : Year_Number;
       result : InputStatus;
       garbage : Boolean;
     begin
       result := GetBirthDay(input, day, month, year, today_day, today_month, today_year);
       garbage := Assert(result = Good, "No parse: " & input, Line => Line);
       declare
         parsedResult : String := IntegerToString(day) & "/" & 
                                  IntegerToString(month) & "/" &
                                  IntegerToString(year);
       begin
         Assert(parsedResult = expected, "Parsed: " & input &
                                         " Expected: " & expected & 
                                         " Actual: " & parsedResult, Line => Line);
       end;
     end CheckBirthDay;

     procedure CheckInvalid(input : in String; today_day : in Day_Number; 
                            today_month : in Month_Number; today_year : in Year_Number;
                            Line : Natural := GNAT.Source_Info.Line) is
       day : Day_Number;
       month : Month_Number;
       year : Year_Number;
       result : InputStatus;
       garbage : Boolean;
     begin
       result := GetBirthDay(input, day, month, year, today_day, today_month, today_year);
       garbage := Assert(result = Absurd, "Parsed: " & input & " Expected: no parse");
     end CheckInvalid;

   begin
     CheckBirthDay("25th of January 2000", 17, 9, 2018, "25/1/2000");
     CheckBirthDay("May 8th 1931", 17, 9, 2018, "8/5/1931");
     CheckBirthDay("17 September 2018", 17, 9, 2018, "17/9/2018");
     CheckBirthDay("16 September 2018", 17, 9, 2018, "16/9/2018");
     CheckBirthDay("18 August 2018", 17, 9, 2018, "18/8/2018");
     CheckBirthDay("18 October 2017", 17, 9, 2018, "18/10/2017");
     CheckBirthDay("1 January 1901", 17, 9, 2018, "1/1/1901");

     CheckInvalid("31st of December 1900", 17, 9, 2018);
     CheckInvalid("June 12th 2344", 17, 9, 2018);
     CheckInvalid("June 12th 2087", 17, 9, 2018);
     CheckInvalid("18th of September 2018", 17, 9, 2018);
     CheckInvalid("16th of October 2018", 17, 9, 2018);
     CheckInvalid("1st of January 2019", 17, 9, 2018);
--  begin read only
   end Test_GetBirthDay;
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
end DateInput.Test_Data.Tests;
