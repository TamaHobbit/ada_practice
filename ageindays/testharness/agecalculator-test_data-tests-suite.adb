--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body AgeCalculator.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.AgeCalculator.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_DaysInMonth_164afd_e8df0d : aliased Runner_1.Test_Case;
   Case_2_1_Test_DaysInMonth_164afd_8234fb : aliased Runner_1.Test_Case;
   Case_3_1_Test_DaysInMonth_164afd_9ce495 : aliased Runner_1.Test_Case;
   Case_4_1_Test_DaysInMonth_164afd_32932e : aliased Runner_1.Test_Case;
   Case_5_1_Test_DaysInMonth_164afd_108a74 : aliased Runner_1.Test_Case;
   Case_6_1_Test_DaysInMonth_164afd_32e647 : aliased Runner_1.Test_Case;
   Case_7_1_Test_DaysInMonth_164afd_f2c915 : aliased Runner_1.Test_Case;
   Case_8_1_Test_DaysInMonth_164afd_6a1c72 : aliased Runner_1.Test_Case;
   Case_9_1_Test_DaysInMonth_164afd_b8163b : aliased Runner_1.Test_Case;
   Case_10_1_Test_DaysInMonth_164afd_a38e78 : aliased Runner_1.Test_Case;
   Case_11_1_Test_DaysInMonth_164afd_3d7caf : aliased Runner_1.Test_Case;
   Case_12_1_Test_DaysInMonth_164afd_e1685b : aliased Runner_1.Test_Case;
   Case_13_1_Test_DaysInMonth_164afd_cbc9c8 : aliased Runner_1.Test_Case;
   Case_14_1_Test_GetAgeDifference_062698 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_DaysInMonth_164afd_e8df0d,
         "agecalculator.ads:11:10:",
         Test_DaysInMonth_164afd_e8df0d'Access);
      Runner_1.Create
        (Case_2_1_Test_DaysInMonth_164afd_8234fb,
         "agecalculator.ads:12:3:",
         Test_DaysInMonth_164afd_8234fb'Access);
      Runner_1.Create
        (Case_3_1_Test_DaysInMonth_164afd_9ce495,
         "agecalculator.ads:13:3:",
         Test_DaysInMonth_164afd_9ce495'Access);
      Runner_1.Create
        (Case_4_1_Test_DaysInMonth_164afd_32932e,
         "agecalculator.ads:14:3:",
         Test_DaysInMonth_164afd_32932e'Access);
      Runner_1.Create
        (Case_5_1_Test_DaysInMonth_164afd_108a74,
         "agecalculator.ads:15:3:",
         Test_DaysInMonth_164afd_108a74'Access);
      Runner_1.Create
        (Case_6_1_Test_DaysInMonth_164afd_32e647,
         "agecalculator.ads:16:3:",
         Test_DaysInMonth_164afd_32e647'Access);
      Runner_1.Create
        (Case_7_1_Test_DaysInMonth_164afd_f2c915,
         "agecalculator.ads:17:3:",
         Test_DaysInMonth_164afd_f2c915'Access);
      Runner_1.Create
        (Case_8_1_Test_DaysInMonth_164afd_6a1c72,
         "agecalculator.ads:18:3:",
         Test_DaysInMonth_164afd_6a1c72'Access);
      Runner_1.Create
        (Case_9_1_Test_DaysInMonth_164afd_b8163b,
         "agecalculator.ads:19:3:",
         Test_DaysInMonth_164afd_b8163b'Access);
      Runner_1.Create
        (Case_10_1_Test_DaysInMonth_164afd_a38e78,
         "agecalculator.ads:20:3:",
         Test_DaysInMonth_164afd_a38e78'Access);
      Runner_1.Create
        (Case_11_1_Test_DaysInMonth_164afd_3d7caf,
         "agecalculator.ads:21:3:",
         Test_DaysInMonth_164afd_3d7caf'Access);
      Runner_1.Create
        (Case_12_1_Test_DaysInMonth_164afd_e1685b,
         "agecalculator.ads:22:3:",
         Test_DaysInMonth_164afd_e1685b'Access);
      Runner_1.Create
        (Case_13_1_Test_DaysInMonth_164afd_cbc9c8,
         "agecalculator.ads:23:3:",
         Test_DaysInMonth_164afd_cbc9c8'Access);
      Runner_1.Create
        (Case_14_1_Test_GetAgeDifference_062698,
         "agecalculator.ads:25:3:",
         Test_GetAgeDifference_062698'Access);

      Result.Add_Test (Case_1_1_Test_DaysInMonth_164afd_e8df0d'Access);
      Result.Add_Test (Case_2_1_Test_DaysInMonth_164afd_8234fb'Access);
      Result.Add_Test (Case_3_1_Test_DaysInMonth_164afd_9ce495'Access);
      Result.Add_Test (Case_4_1_Test_DaysInMonth_164afd_32932e'Access);
      Result.Add_Test (Case_5_1_Test_DaysInMonth_164afd_108a74'Access);
      Result.Add_Test (Case_6_1_Test_DaysInMonth_164afd_32e647'Access);
      Result.Add_Test (Case_7_1_Test_DaysInMonth_164afd_f2c915'Access);
      Result.Add_Test (Case_8_1_Test_DaysInMonth_164afd_6a1c72'Access);
      Result.Add_Test (Case_9_1_Test_DaysInMonth_164afd_b8163b'Access);
      Result.Add_Test (Case_10_1_Test_DaysInMonth_164afd_a38e78'Access);
      Result.Add_Test (Case_11_1_Test_DaysInMonth_164afd_3d7caf'Access);
      Result.Add_Test (Case_12_1_Test_DaysInMonth_164afd_e1685b'Access);
      Result.Add_Test (Case_13_1_Test_DaysInMonth_164afd_cbc9c8'Access);
      Result.Add_Test (Case_14_1_Test_GetAgeDifference_062698'Access);

      return Result'Access;

   end Suite;

end AgeCalculator.Test_Data.Tests.Suite;
--  end read only
