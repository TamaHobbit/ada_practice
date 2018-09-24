--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body AgeCalculator.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.AgeCalculator.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_DaysInMonth_164afd : aliased Runner_1.Test_Case;
   Case_2_1_Test_GetAgeDifference_f0660d : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_DaysInMonth_164afd,
         "agecalculator.ads:10:3:",
         Test_DaysInMonth_164afd'Access);
      Runner_1.Create
        (Case_2_1_Test_GetAgeDifference_f0660d,
         "agecalculator.ads:12:3:",
         Test_GetAgeDifference_f0660d'Access);

      Result.Add_Test (Case_1_1_Test_DaysInMonth_164afd'Access);
      Result.Add_Test (Case_2_1_Test_GetAgeDifference_f0660d'Access);

      return Result'Access;

   end Suite;

end AgeCalculator.Test_Data.Tests.Suite;
--  end read only
