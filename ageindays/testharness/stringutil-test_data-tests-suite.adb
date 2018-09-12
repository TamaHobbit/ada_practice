--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body StringUtil.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.StringUtil.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_IntegerToString_213542 : aliased Runner_1.Test_Case;
   Case_2_1_Test_StringJoin_7d3099 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_IntegerToString_213542,
         "stringutil.ads:9:3:",
         Test_IntegerToString_213542'Access);
      Runner_1.Create
        (Case_2_1_Test_StringJoin_7d3099,
         "stringutil.ads:11:3:",
         Test_StringJoin_7d3099'Access);

      Result.Add_Test (Case_1_1_Test_IntegerToString_213542'Access);
      Result.Add_Test (Case_2_1_Test_StringJoin_7d3099'Access);

      return Result'Access;

   end Suite;

end StringUtil.Test_Data.Tests.Suite;
--  end read only
