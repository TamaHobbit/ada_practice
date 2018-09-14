with Ada.Calendar;           use Ada.Calendar;

package AgeCalculator is

  type DifferenceYears is range Year_Number'First - Year_Number'Last..Year_Number'Last - Year_Number'First;
  type DifferenceMonths is range Month_Number'First - Month_Number'Last..Month_Number'Last - Month_Number'First;
  type DifferenceDays is range Day_Number'First - Day_Number'Last..Day_Number'Last - Day_Number'First;
  subtype NumberOfDaysOld is Integer range 0..(366*(Year_Number'Last-Year_Number'First + 1));

  function DaysInMonth(month : in Month_Number; year : in Year_Number) return Day_Number;

  procedure GetAgeDifference(birth_day : in Day_Number; birth_month : in Month_Number; birth_year : in Year_Number;
                            today_day : in Day_Number; today_month : in Month_Number; today_year : in Year_Number;
                            DaysOld : out DifferenceDays; MonthsOld : out DifferenceMonths; YearsOld : out DifferenceYears;
                            TotalDaysOld : out NumberOfDaysOld);

end AgeCalculator;
