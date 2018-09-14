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
   begin

     Assert(DaysInMonth(9, 2018) = 30, "September has 30 days");

--  begin read only
   end Test_DaysInMonth;
--  end read only


--  begin read only
   procedure Test_GetAgeDifference (Gnattest_T : in out Test);
   procedure Test_GetAgeDifference_062698 (Gnattest_T : in out Test) renames Test_GetAgeDifference;
--  id:2.2/062698c61d6bceda/GetAgeDifference/1/0/
   procedure Test_GetAgeDifference (Gnattest_T : in out Test) is
   --  agecalculator.ads:12:3:GetAgeDifference
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

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
