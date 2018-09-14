with Ada.Calendar;           use Ada.Calendar;

package AgeCalculator is

  type DifferenceYears is range Year_Number'First - Year_Number'Last..Year_Number'Last - Year_Number'First;
  type DifferenceMonths is range Month_Number'First - Month_Number'Last..Month_Number'Last - Month_Number'First;
  type DifferenceDays is range Day_Number'First - Day_Number'Last..Day_Number'Last - Day_Number'First;
  type NumberOfDaysOld is range 0..(366*(Year_Number'Last-Year_Number'First + 1));

  function DaysInMonth(month : in Month_Number; year : in Year_Number) return Day_Number
    with Test_Case => (Name => "JanuaryHas31Days", Mode => Nominal);
  pragma Test_Case    (Name => "FebruaryHas28DaysInCommonYear", Mode => Nominal);
  pragma Test_Case    (Name => "FebruaryHas29DaysInLeapYear", Mode => Nominal);
  pragma Test_Case    (Name => "MarchHas31Days", Mode => Nominal);
  pragma Test_Case    (Name => "AprilHas30Days", Mode => Nominal);
  pragma Test_Case    (Name => "MayHas31Days", Mode => Nominal);
  pragma Test_Case    (Name => "JuneHas30Days", Mode => Nominal);
  pragma Test_Case    (Name => "JulyHas31Days", Mode => Nominal);
  pragma Test_Case    (Name => "AugustHas31Days", Mode => Nominal);
  pragma Test_Case    (Name => "SeptemberHas30Days", Mode => Nominal);
  pragma Test_Case    (Name => "OctoberHas31Days", Mode => Nominal);
  pragma Test_Case    (Name => "NovemberHas30Days", Mode => Nominal);
  pragma Test_Case    (Name => "DecemberHas31Days", Mode => Nominal);

  procedure GetAgeDifference(birth_day : in Day_Number; birth_month : in Month_Number; birth_year : in Year_Number;
                            today_day : in Day_Number; today_month : in Month_Number; today_year : in Year_Number;
                            DaysOld : out DifferenceDays; MonthsOld : out DifferenceMonths; YearsOld : out DifferenceYears;
                            TotalDaysOld : out NumberOfDaysOld);

end AgeCalculator;
