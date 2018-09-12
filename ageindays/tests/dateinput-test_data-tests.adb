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

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

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

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

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
