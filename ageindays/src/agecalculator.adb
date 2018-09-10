pragma Ada_2012;
package body AgeCalculator is

  function IsLeapYear(year : Year_Number) return Boolean is
  begin
    return year mod 4 = 0 and (year mod 100 /= 0 or year mod 400 = 0);
  end IsLeapYear;

  function DaysInMonth(month : in Month_Number; year : in Year_Number) return Day_Number is
  begin
    if month = 2 then
      return (if IsLeapYear(year) then 29 else 28);
    end if;
    if month <= 7 then
      return (30 + (month mod 2));
    end if;
    return (31 - (month mod 2));
  end DaysInMonth;

  function PreviousMonth(month : in Month_Number) return Month_Number is
  begin
    return (if month = 1 then 12 else month - 1);
  end PreviousMonth;

  function NextMonth(month : in Month_Number) return Month_Number is
  begin
    return (if month = 12 then 1 else month + 1);
  end NextMonth;

  function WrapMonth(month : in Integer) return Month_Number is
  begin
    return ((month - 1) mod 12) + 1;
  end WrapMonth;

  procedure GetAgeDifference(birth_day : in Day_Number; birth_month : in Month_Number; birth_year : in Year_Number;
                            today_day : in Day_Number; today_month : in Month_Number; today_year : in Year_Number;
                            DaysOld : out DifferenceDays; MonthsOld : out DifferenceMonths; YearsOld : out DifferenceYears;
                            TotalDaysOld : out NumberOfDaysOld) is
  begin
    YearsOld := DifferenceYears(today_year - birth_year);
    MonthsOld := DifferenceMonths(today_month - birth_month);
    DaysOld := DifferenceDays(today_day - birth_day);
    if DaysOld < 0 then
      MonthsOld := MonthsOld - 1;
      DaysOld := DifferenceDays(Integer(DaysOld) + Integer(DaysInMonth(PreviousMonth(birth_month), birth_year)));
    end if;
    if MonthsOld < 0 then
      YearsOld := YearsOld - 1;
      MonthsOld := MonthsOld + 12;
    end if;

    declare
      BirthDayBeforeLeapDay : Boolean := birth_month <= 2;
    begin
      TotalDaysOld := 0;
      for year in birth_year..Year_Number(Integer(birth_year) + Integer(YearsOld) - 1) loop
        declare
          LeapDayYear : Year_Number := (if BirthDayBeforeLeapDay then year else year + 1);
          DaysInYear : NumberOfDaysOld := (if IsLeapYear(LeapDayYear) then 366 else 365);
        begin
          TotalDaysOld := TotalDaysOld + DaysInYear;
        end;
      end loop;
    end;

    if MonthsOld = 0 and today_day >= birth_day then
      TotalDaysOld := TotalDaysOld + NumberOfDaysOld(today_day - birth_day);
    else
      TotalDaysOld := TotalDaysOld + NumberOfDaysOld(DaysInMonth(birth_month, birth_year) - birth_day);
      declare
        beginMonth : Month_Number := NextMonth(birth_month);
        endMonth : Month_Number := PreviousMonth(today_month);
        unwrappedEndMonth : Integer := (if today_month >= beginMonth then endMonth else endMonth + 12);
      begin
        for month_unwrapped in beginMonth..unwrappedEndMonth loop
          declare
            month : Month_Number := Month_Number(WrapMonth(month_unwrapped));
            yearOfMonth : Year_Number := (if month > today_month then today_year - 1 else today_year);
          begin
            TotalDaysOld := TotalDaysOld + NumberOfDaysOld(DaysInMonth(month, yearOfMonth));
          end;
        end loop;
      end;
      TotalDaysOld := TotalDaysOld + NumberOfDaysOld(today_day);
    end if;
  end GetAgeDifference;

end AgeCalculator;
