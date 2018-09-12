--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body DateInput.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.DateInput.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_GetDate_cc90ae : aliased Runner_1.Test_Case;
   Case_2_1_Test_GetBirthDay_e47e4e : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_GetDate_cc90ae,
         "dateinput.ads:12:3:",
         Test_GetDate_cc90ae'Access);
      Runner_1.Create
        (Case_2_1_Test_GetBirthDay_e47e4e,
         "dateinput.ads:15:3:",
         Test_GetBirthDay_e47e4e'Access);

      Result.Add_Test (Case_1_1_Test_GetDate_cc90ae'Access);
      Result.Add_Test (Case_2_1_Test_GetBirthDay_e47e4e'Access);

      return Result'Access;

   end Suite;

end DateInput.Test_Data.Tests.Suite;
--  end read only
