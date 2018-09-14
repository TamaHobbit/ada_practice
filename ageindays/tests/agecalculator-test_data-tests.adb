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
   function Wrap_Test_DaysInMonth_164afd_e8df0d (month : in Month_Number; year : in Year_Number)  return Day_Number
   is
   begin
      begin
         pragma Assert
           (True);
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "req_sloc(agecalculator.ads:0):JanuaryHas31Days test requirement violated");
      end;
      declare
         Test_DaysInMonth_164afd_e8df0d_Result : constant Day_Number := GNATtest_Generated.GNATtest_Standard.AgeCalculator.DaysInMonth (month, year);
      begin
         begin
            pragma Assert
              (True);
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(agecalculator.ads:0:):JanuaryHas31Days test commitment violated");
         end;
         return Test_DaysInMonth_164afd_e8df0d_Result;
      end;
   end Wrap_Test_DaysInMonth_164afd_e8df0d;
--  end read only

--  begin read only
   procedure Test_DaysInMonth_januaryhas31days (Gnattest_T : in out Test);
   procedure Test_DaysInMonth_164afd_e8df0d (Gnattest_T : in out Test) renames Test_DaysInMonth_januaryhas31days;
--  id:2.2/164afd8f79290564/DaysInMonth/1/0/januaryhas31days/
   procedure Test_DaysInMonth_januaryhas31days (Gnattest_T : in out Test) is
   --  agecalculator.ads:10:3:DaysInMonth
      function DaysInMonth (month : in Month_Number; year : in Year_Number) return Day_Number renames Wrap_Test_DaysInMonth_164afd_e8df0d;
--  end read only
   begin

     Assert(DaysInMonth(1, 2018) = 31, "January has 31 days");

--  begin read only
   end Test_DaysInMonth_januaryhas31days;
--  end read only

--  begin read only
   function Wrap_Test_DaysInMonth_164afd_8234fb (month : in Month_Number; year : in Year_Number)  return Day_Number
   is
   begin
      begin
         pragma Assert
           (True);
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "req_sloc(agecalculator.ads:0:):FebruaryHas28DaysInCommonYear test requirement violated");
      end;
      declare
         Test_DaysInMonth_164afd_8234fb_Result : constant Day_Number := GNATtest_Generated.GNATtest_Standard.AgeCalculator.DaysInMonth (month, year);
      begin
         begin
            pragma Assert
              (True);
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(agecalculator.ads:0:):FebruaryHas28DaysInCommonYear test commitment violated");
         end;
         return Test_DaysInMonth_164afd_8234fb_Result;
      end;
   end Wrap_Test_DaysInMonth_164afd_8234fb;
--  end read only

--  begin read only
   procedure Test_DaysInMonth_februaryhas28daysincommonyear (Gnattest_T : in out Test);
   procedure Test_DaysInMonth_164afd_8234fb (Gnattest_T : in out Test) renames Test_DaysInMonth_februaryhas28daysincommonyear;
--  id:2.2/164afd8f79290564/DaysInMonth/1/0/februaryhas28daysincommonyear/
   procedure Test_DaysInMonth_februaryhas28daysincommonyear (Gnattest_T : in out Test) is
   --  agecalculator.ads:10:3:DaysInMonth
      function DaysInMonth (month : in Month_Number; year : in Year_Number) return Day_Number renames Wrap_Test_DaysInMonth_164afd_8234fb;
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (DaysInMonth(2, 1999) = 28,
         "February has 28 days in common year");

--  begin read only
   end Test_DaysInMonth_februaryhas28daysincommonyear;
--  end read only

--  begin read only
   function Wrap_Test_DaysInMonth_164afd_9ce495 (month : in Month_Number; year : in Year_Number)  return Day_Number
   is
   begin
      begin
         pragma Assert
           (True);
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "req_sloc(agecalculator.ads:0:):FebruaryHas29DaysInLeapYear test requirement violated");
      end;
      declare
         Test_DaysInMonth_164afd_9ce495_Result : constant Day_Number := GNATtest_Generated.GNATtest_Standard.AgeCalculator.DaysInMonth (month, year);
      begin
         begin
            pragma Assert
              (True);
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(agecalculator.ads:0:):FebruaryHas29DaysInLeapYear test commitment violated");
         end;
         return Test_DaysInMonth_164afd_9ce495_Result;
      end;
   end Wrap_Test_DaysInMonth_164afd_9ce495;
--  end read only

--  begin read only
   procedure Test_DaysInMonth_februaryhas29daysinleapyear (Gnattest_T : in out Test);
   procedure Test_DaysInMonth_164afd_9ce495 (Gnattest_T : in out Test) renames Test_DaysInMonth_februaryhas29daysinleapyear;
--  id:2.2/164afd8f79290564/DaysInMonth/1/0/februaryhas29daysinleapyear/
   procedure Test_DaysInMonth_februaryhas29daysinleapyear (Gnattest_T : in out Test) is
   --  agecalculator.ads:10:3:DaysInMonth
      function DaysInMonth (month : in Month_Number; year : in Year_Number) return Day_Number renames Wrap_Test_DaysInMonth_164afd_9ce495;
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (DaysInMonth(2, 2004) = 29,
         "February has 29 days in a leap year");

--  begin read only
   end Test_DaysInMonth_februaryhas29daysinleapyear;
--  end read only

--  begin read only
   function Wrap_Test_DaysInMonth_164afd_32932e (month : in Month_Number; year : in Year_Number)  return Day_Number
   is
   begin
      begin
         pragma Assert
           (True);
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "req_sloc(agecalculator.ads:0:):MarchHas31Days test requirement violated");
      end;
      declare
         Test_DaysInMonth_164afd_32932e_Result : constant Day_Number := GNATtest_Generated.GNATtest_Standard.AgeCalculator.DaysInMonth (month, year);
      begin
         begin
            pragma Assert
              (True);
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(agecalculator.ads:0:):MarchHas31Days test commitment violated");
         end;
         return Test_DaysInMonth_164afd_32932e_Result;
      end;
   end Wrap_Test_DaysInMonth_164afd_32932e;
--  end read only

--  begin read only
   procedure Test_DaysInMonth_marchhas31days (Gnattest_T : in out Test);
   procedure Test_DaysInMonth_164afd_32932e (Gnattest_T : in out Test) renames Test_DaysInMonth_marchhas31days;
--  id:2.2/164afd8f79290564/DaysInMonth/1/0/marchhas31days/
   procedure Test_DaysInMonth_marchhas31days (Gnattest_T : in out Test) is
   --  agecalculator.ads:10:3:DaysInMonth
      function DaysInMonth (month : in Month_Number; year : in Year_Number) return Day_Number renames Wrap_Test_DaysInMonth_164afd_32932e;
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (DaysInMonth(3, 2000) = 31,
         "March has 31 days");

--  begin read only
   end Test_DaysInMonth_marchhas31days;
--  end read only

--  begin read only
   function Wrap_Test_DaysInMonth_164afd_108a74 (month : in Month_Number; year : in Year_Number)  return Day_Number
   is
   begin
      begin
         pragma Assert
           (True);
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "req_sloc(agecalculator.ads:0:):AprilHas30Days test requirement violated");
      end;
      declare
         Test_DaysInMonth_164afd_108a74_Result : constant Day_Number := GNATtest_Generated.GNATtest_Standard.AgeCalculator.DaysInMonth (month, year);
      begin
         begin
            pragma Assert
              (True);
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(agecalculator.ads:0:):AprilHas30Days test commitment violated");
         end;
         return Test_DaysInMonth_164afd_108a74_Result;
      end;
   end Wrap_Test_DaysInMonth_164afd_108a74;
--  end read only

--  begin read only
   procedure Test_DaysInMonth_aprilhas30days (Gnattest_T : in out Test);
   procedure Test_DaysInMonth_164afd_108a74 (Gnattest_T : in out Test) renames Test_DaysInMonth_aprilhas30days;
--  id:2.2/164afd8f79290564/DaysInMonth/1/0/aprilhas30days/
   procedure Test_DaysInMonth_aprilhas30days (Gnattest_T : in out Test) is
   --  agecalculator.ads:10:3:DaysInMonth
      function DaysInMonth (month : in Month_Number; year : in Year_Number) return Day_Number renames Wrap_Test_DaysInMonth_164afd_108a74;
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (DaysInMonth(4, 2000) = 30,
         "April has 30 days");

--  begin read only
   end Test_DaysInMonth_aprilhas30days;
--  end read only

--  begin read only
   function Wrap_Test_DaysInMonth_164afd_32e647 (month : in Month_Number; year : in Year_Number)  return Day_Number
   is
   begin
      begin
         pragma Assert
           (True);
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "req_sloc(agecalculator.ads:0:):MayHas31Days test requirement violated");
      end;
      declare
         Test_DaysInMonth_164afd_32e647_Result : constant Day_Number := GNATtest_Generated.GNATtest_Standard.AgeCalculator.DaysInMonth (month, year);
      begin
         begin
            pragma Assert
              (True);
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(agecalculator.ads:0:):MayHas31Days test commitment violated");
         end;
         return Test_DaysInMonth_164afd_32e647_Result;
      end;
   end Wrap_Test_DaysInMonth_164afd_32e647;
--  end read only

--  begin read only
   procedure Test_DaysInMonth_mayhas31days (Gnattest_T : in out Test);
   procedure Test_DaysInMonth_164afd_32e647 (Gnattest_T : in out Test) renames Test_DaysInMonth_mayhas31days;
--  id:2.2/164afd8f79290564/DaysInMonth/1/0/mayhas31days/
   procedure Test_DaysInMonth_mayhas31days (Gnattest_T : in out Test) is
   --  agecalculator.ads:10:3:DaysInMonth
      function DaysInMonth (month : in Month_Number; year : in Year_Number) return Day_Number renames Wrap_Test_DaysInMonth_164afd_32e647;
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (DaysInMonth(5,2000) = 31,
         "May has 31 days");

--  begin read only
   end Test_DaysInMonth_mayhas31days;
--  end read only

--  begin read only
   function Wrap_Test_DaysInMonth_164afd_f2c915 (month : in Month_Number; year : in Year_Number)  return Day_Number
   is
   begin
      begin
         pragma Assert
           (True);
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "req_sloc(agecalculator.ads:0:):JuneHas30Days test requirement violated");
      end;
      declare
         Test_DaysInMonth_164afd_f2c915_Result : constant Day_Number := GNATtest_Generated.GNATtest_Standard.AgeCalculator.DaysInMonth (month, year);
      begin
         begin
            pragma Assert
              (True);
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(agecalculator.ads:0:):JuneHas30Days test commitment violated");
         end;
         return Test_DaysInMonth_164afd_f2c915_Result;
      end;
   end Wrap_Test_DaysInMonth_164afd_f2c915;
--  end read only

--  begin read only
   procedure Test_DaysInMonth_junehas30days (Gnattest_T : in out Test);
   procedure Test_DaysInMonth_164afd_f2c915 (Gnattest_T : in out Test) renames Test_DaysInMonth_junehas30days;
--  id:2.2/164afd8f79290564/DaysInMonth/1/0/junehas30days/
   procedure Test_DaysInMonth_junehas30days (Gnattest_T : in out Test) is
   --  agecalculator.ads:10:3:DaysInMonth
      function DaysInMonth (month : in Month_Number; year : in Year_Number) return Day_Number renames Wrap_Test_DaysInMonth_164afd_f2c915;
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (DaysInMonth(6, 2000) = 30,
         "June has 30 days");

--  begin read only
   end Test_DaysInMonth_junehas30days;
--  end read only

--  begin read only
   function Wrap_Test_DaysInMonth_164afd_6a1c72 (month : in Month_Number; year : in Year_Number)  return Day_Number
   is
   begin
      begin
         pragma Assert
           (True);
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "req_sloc(agecalculator.ads:0:):JulyHas31Days test requirement violated");
      end;
      declare
         Test_DaysInMonth_164afd_6a1c72_Result : constant Day_Number := GNATtest_Generated.GNATtest_Standard.AgeCalculator.DaysInMonth (month, year);
      begin
         begin
            pragma Assert
              (True);
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(agecalculator.ads:0:):JulyHas31Days test commitment violated");
         end;
         return Test_DaysInMonth_164afd_6a1c72_Result;
      end;
   end Wrap_Test_DaysInMonth_164afd_6a1c72;
--  end read only

--  begin read only
   procedure Test_DaysInMonth_julyhas31days (Gnattest_T : in out Test);
   procedure Test_DaysInMonth_164afd_6a1c72 (Gnattest_T : in out Test) renames Test_DaysInMonth_julyhas31days;
--  id:2.2/164afd8f79290564/DaysInMonth/1/0/julyhas31days/
   procedure Test_DaysInMonth_julyhas31days (Gnattest_T : in out Test) is
   --  agecalculator.ads:10:3:DaysInMonth
      function DaysInMonth (month : in Month_Number; year : in Year_Number) return Day_Number renames Wrap_Test_DaysInMonth_164afd_6a1c72;
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (DaysInMonth(7, 2000) = 31,
         "July has 31 days");

--  begin read only
   end Test_DaysInMonth_julyhas31days;
--  end read only

--  begin read only
   function Wrap_Test_DaysInMonth_164afd_b8163b (month : in Month_Number; year : in Year_Number)  return Day_Number
   is
   begin
      begin
         pragma Assert
           (True);
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "req_sloc(agecalculator.ads:0:):AugustHas31Days test requirement violated");
      end;
      declare
         Test_DaysInMonth_164afd_b8163b_Result : constant Day_Number := GNATtest_Generated.GNATtest_Standard.AgeCalculator.DaysInMonth (month, year);
      begin
         begin
            pragma Assert
              (True);
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(agecalculator.ads:0:):AugustHas31Days test commitment violated");
         end;
         return Test_DaysInMonth_164afd_b8163b_Result;
      end;
   end Wrap_Test_DaysInMonth_164afd_b8163b;
--  end read only

--  begin read only
   procedure Test_DaysInMonth_augusthas31days (Gnattest_T : in out Test);
   procedure Test_DaysInMonth_164afd_b8163b (Gnattest_T : in out Test) renames Test_DaysInMonth_augusthas31days;
--  id:2.2/164afd8f79290564/DaysInMonth/1/0/augusthas31days/
   procedure Test_DaysInMonth_augusthas31days (Gnattest_T : in out Test) is
   --  agecalculator.ads:10:3:DaysInMonth
      function DaysInMonth (month : in Month_Number; year : in Year_Number) return Day_Number renames Wrap_Test_DaysInMonth_164afd_b8163b;
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (DaysInMonth(8, 2000) = 31,
         "August has 31 days");

--  begin read only
   end Test_DaysInMonth_augusthas31days;
--  end read only

--  begin read only
   function Wrap_Test_DaysInMonth_164afd_a38e78 (month : in Month_Number; year : in Year_Number)  return Day_Number
   is
   begin
      begin
         pragma Assert
           (True);
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "req_sloc(agecalculator.ads:0:):SeptemberHas30Days test requirement violated");
      end;
      declare
         Test_DaysInMonth_164afd_a38e78_Result : constant Day_Number := GNATtest_Generated.GNATtest_Standard.AgeCalculator.DaysInMonth (month, year);
      begin
         begin
            pragma Assert
              (True);
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(agecalculator.ads:0:):SeptemberHas30Days test commitment violated");
         end;
         return Test_DaysInMonth_164afd_a38e78_Result;
      end;
   end Wrap_Test_DaysInMonth_164afd_a38e78;
--  end read only

--  begin read only
   procedure Test_DaysInMonth_septemberhas30days (Gnattest_T : in out Test);
   procedure Test_DaysInMonth_164afd_a38e78 (Gnattest_T : in out Test) renames Test_DaysInMonth_septemberhas30days;
--  id:2.2/164afd8f79290564/DaysInMonth/1/0/septemberhas30days/
   procedure Test_DaysInMonth_septemberhas30days (Gnattest_T : in out Test) is
   --  agecalculator.ads:10:3:DaysInMonth
      function DaysInMonth (month : in Month_Number; year : in Year_Number) return Day_Number renames Wrap_Test_DaysInMonth_164afd_a38e78;
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (DaysInMonth(9, 2000) = 30,
         "September has 30 days");

--  begin read only
   end Test_DaysInMonth_septemberhas30days;
--  end read only

--  begin read only
   function Wrap_Test_DaysInMonth_164afd_3d7caf (month : in Month_Number; year : in Year_Number)  return Day_Number
   is
   begin
      begin
         pragma Assert
           (True);
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "req_sloc(agecalculator.ads:0:):OctoberHas31Days test requirement violated");
      end;
      declare
         Test_DaysInMonth_164afd_3d7caf_Result : constant Day_Number := GNATtest_Generated.GNATtest_Standard.AgeCalculator.DaysInMonth (month, year);
      begin
         begin
            pragma Assert
              (True);
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(agecalculator.ads:0:):OctoberHas31Days test commitment violated");
         end;
         return Test_DaysInMonth_164afd_3d7caf_Result;
      end;
   end Wrap_Test_DaysInMonth_164afd_3d7caf;
--  end read only

--  begin read only
   procedure Test_DaysInMonth_octoberhas31days (Gnattest_T : in out Test);
   procedure Test_DaysInMonth_164afd_3d7caf (Gnattest_T : in out Test) renames Test_DaysInMonth_octoberhas31days;
--  id:2.2/164afd8f79290564/DaysInMonth/1/0/octoberhas31days/
   procedure Test_DaysInMonth_octoberhas31days (Gnattest_T : in out Test) is
   --  agecalculator.ads:10:3:DaysInMonth
      function DaysInMonth (month : in Month_Number; year : in Year_Number) return Day_Number renames Wrap_Test_DaysInMonth_164afd_3d7caf;
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (DaysInMonth(10, 2000) = 31,
         "October has 31 days");

--  begin read only
   end Test_DaysInMonth_octoberhas31days;
--  end read only

--  begin read only
   function Wrap_Test_DaysInMonth_164afd_e1685b (month : in Month_Number; year : in Year_Number)  return Day_Number
   is
   begin
      begin
         pragma Assert
           (True);
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "req_sloc(agecalculator.ads:0:):NovemberHas30Days test requirement violated");
      end;
      declare
         Test_DaysInMonth_164afd_e1685b_Result : constant Day_Number := GNATtest_Generated.GNATtest_Standard.AgeCalculator.DaysInMonth (month, year);
      begin
         begin
            pragma Assert
              (True);
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(agecalculator.ads:0:):NovemberHas30Days test commitment violated");
         end;
         return Test_DaysInMonth_164afd_e1685b_Result;
      end;
   end Wrap_Test_DaysInMonth_164afd_e1685b;
--  end read only

--  begin read only
   procedure Test_DaysInMonth_novemberhas30days (Gnattest_T : in out Test);
   procedure Test_DaysInMonth_164afd_e1685b (Gnattest_T : in out Test) renames Test_DaysInMonth_novemberhas30days;
--  id:2.2/164afd8f79290564/DaysInMonth/1/0/novemberhas30days/
   procedure Test_DaysInMonth_novemberhas30days (Gnattest_T : in out Test) is
   --  agecalculator.ads:10:3:DaysInMonth
      function DaysInMonth (month : in Month_Number; year : in Year_Number) return Day_Number renames Wrap_Test_DaysInMonth_164afd_e1685b;
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (DaysInMonth(11, 2000) = 30,
         "November has 30 days");

--  begin read only
   end Test_DaysInMonth_novemberhas30days;
--  end read only

--  begin read only
   function Wrap_Test_DaysInMonth_164afd_cbc9c8 (month : in Month_Number; year : in Year_Number)  return Day_Number
   is
   begin
      begin
         pragma Assert
           (True);
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "req_sloc(agecalculator.ads:0:):DecemberHas31Days test requirement violated");
      end;
      declare
         Test_DaysInMonth_164afd_cbc9c8_Result : constant Day_Number := GNATtest_Generated.GNATtest_Standard.AgeCalculator.DaysInMonth (month, year);
      begin
         begin
            pragma Assert
              (True);
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(agecalculator.ads:0:):DecemberHas31Days test commitment violated");
         end;
         return Test_DaysInMonth_164afd_cbc9c8_Result;
      end;
   end Wrap_Test_DaysInMonth_164afd_cbc9c8;
--  end read only

--  begin read only
   procedure Test_DaysInMonth_decemberhas31days (Gnattest_T : in out Test);
   procedure Test_DaysInMonth_164afd_cbc9c8 (Gnattest_T : in out Test) renames Test_DaysInMonth_decemberhas31days;
--  id:2.2/164afd8f79290564/DaysInMonth/1/0/decemberhas31days/
   procedure Test_DaysInMonth_decemberhas31days (Gnattest_T : in out Test) is
   --  agecalculator.ads:10:3:DaysInMonth
      function DaysInMonth (month : in Month_Number; year : in Year_Number) return Day_Number renames Wrap_Test_DaysInMonth_164afd_cbc9c8;
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (DaysInMonth(12, 2000) = 31,
         "December has 31 days");

--  begin read only
   end Test_DaysInMonth_decemberhas31days;
--  end read only


--  begin read only
   procedure Test_GetAgeDifference (Gnattest_T : in out Test);
   procedure Test_GetAgeDifference_062698 (Gnattest_T : in out Test) renames Test_GetAgeDifference;
--  id:2.2/062698c61d6bceda/GetAgeDifference/1/0/
   procedure Test_GetAgeDifference (Gnattest_T : in out Test) is
   --  agecalculator.ads:25:3:GetAgeDifference
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
