--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into StringUtil.Test_Data.

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
package body StringUtil.Test_Data.Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

--  begin read only
--  end read only

--  begin read only
   procedure Test_IntegerToString (Gnattest_T : in out Test);
   procedure Test_IntegerToString_213542 (Gnattest_T : in out Test) renames Test_IntegerToString;
--  id:2.2/2135429b0847bdc5/IntegerToString/1/0/
   procedure Test_IntegerToString (Gnattest_T : in out Test) is
   --  stringutil.ads:9:3:IntegerToString
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_IntegerToString;
--  end read only


--  begin read only
   procedure Test_StringJoin (Gnattest_T : in out Test);
   procedure Test_StringJoin_7d3099 (Gnattest_T : in out Test) renames Test_StringJoin;
--  id:2.2/7d3099cf2d3612b1/StringJoin/1/0/
   procedure Test_StringJoin (Gnattest_T : in out Test) is
   --  stringutil.ads:11:3:StringJoin
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_StringJoin;
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
end StringUtil.Test_Data.Tests;
