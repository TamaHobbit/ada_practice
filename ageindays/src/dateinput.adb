pragma Ada_2012;
package body DateInput is

  package Month_String is new Ada.Strings.Bounded.Generic_Bounded_Length(13);

  type Month_String_Array is array (Month_Number'Range) of Month_String.Bounded_String;

  function ToUnboundedStringArray(months : in Month_String_Array) return String_Array is
    Result : String_Array(Integer(Month_Number'First)..Integer(Month_Number'Last));
  begin
    for i in Month_Number'Range loop
      Result(Integer(i)) := To_Unbounded_String(Month_String.To_String(months(i)));
    end loop;
    return Result;
  end ToUnboundedStringArray;

  Months : Month_String_Array := (
                                  Month_String.To_Bounded_String("(J|j)anuary"),
                                  Month_String.To_Bounded_String("(F|f)ebruary"),
                                  Month_String.To_Bounded_String("(M|m)arch"),
                                  Month_String.To_Bounded_String("(A|a)pril"),
                                  Month_String.To_Bounded_String("(M|m)ay"),
                                  Month_String.To_Bounded_String("(J|j)une"),
                                  Month_String.To_Bounded_String("(J|j)uly"),
                                  Month_String.To_Bounded_String("(A|a)ugust"),
                                  Month_String.To_Bounded_String("(S|s)eptember"),
                                  Month_String.To_Bounded_String("(O|o)ctober"),
                                  Month_String.To_Bounded_String("(N|n)ovember"),
                                  Month_String.To_Bounded_String("(D|d)ecember")
                                 );

  function GetMonthIndex(monthName : in Month_String.Bounded_String) return Month_Number is
  begin
    for i in Month_Number'Range loop
      declare
        MonthRegex : constant Pattern_Matcher := Compile(Month_String.To_String(Months(i)));
        Matches : Match_Array (0..1);
      begin
        Match(MonthRegex, Month_String.To_String(monthName), Matches);
        if Matches(0) /= No_Match then
          return i;
        end if;
      end;
    end loop;
    raise Program_Error;
  end GetMonthIndex;

  function GetDate(format : in DateFormat; input : in String; day : out Day_Number; 
                   month : out Month_Number; year : out Year_Number) return InputStatus is
    Re : constant Pattern_Matcher := Compile(To_String(format.regex));
    Matches : Match_Array (0..format.highestIndex);
  begin
    Match(Re, Input, Matches);

    if Matches(0) = No_Match then
      return Absurd;
    end if;

    declare
      MonthMatch : GNAT.Regpat.Match_Location := Matches(format.monthIndex);
      MonthString : Month_String.Bounded_String := Month_String.To_Bounded_String(
                                          Input(MonthMatch.First .. MonthMatch.Last));
    begin
      month := Integer(GetMonthIndex(MonthString));
    end;

    declare
      YearMatch : GNAT.Regpat.Match_Location := Matches(format.yearIndex);
      YearInteger : Integer := Integer'Value(Input(YearMatch.First .. YearMatch.Last));
    begin
      if YearInteger < 1901 or YearInteger > Year_Number'Last then
        return Absurd;
      end if;
      year := Year_Number(YearInteger);
    end;

    declare
      DayInteger : Integer range 0..39;
      DayMatch : GNAT.Regpat.Match_Location := Matches(format.dayIndex);
      DaysInBirthMonth : constant Day_Number := DaysInMonth(month, year);
    begin
      DayInteger := Integer'Value(Input(DayMatch.First .. DayMatch.Last));
      if DayInteger < Day_Number'First or DayInteger > DaysInBirthMonth then
        return Absurd;
      end if;
      day := Day_Number(DayInteger);
      return Good;
    end;
  end GetDate;

  type Format_Array is array (Integer range <>) of DateFormat;

  function GetDate(formats : Format_Array; input : in String; day : out Day_Number;
                   month : out Month_Number; year : out Year_Number)
                     return InputStatus is
    fitsFormat : InputStatus := Good;
  begin
    for I in formats'Range loop
      fitsFormat := GetDate(formats(I), input, day, month, year);
      if fitsFormat = Good then
        return Good;
      end if;
    end loop;
    return Absurd;
  end GetDate;

  function GetDateFormats return Format_Array is
    unboundedMonths : String_Array := ToUnboundedStringArray(Months);
    monthNameRegex : String := "(" & StringJoin("|", unboundedMonths) & ")";
    englishStandard : constant DateFormat := (regex => To_Unbounded_String(
                        "(^(1|2|3)?\d)(st|th|nd|rd)? (of )?" & monthNameRegex & 
                        " ((19|20)\d{2})$"
                      ), highestIndex => 19, dayIndex => 1, monthIndex => 5, yearIndex => 18);
    englishReverse : constant DateFormat := (regex => To_Unbounded_String(
                        monthNameRegex & " ((1|2|3)?\d)(st|th|nd|rd)?,? ((19|20)\d{2})$"
                      ), highestIndex => 18, dayIndex => 14, monthIndex => 1, yearIndex => 17);
  begin
    return (englishStandard, englishReverse);
  end GetDateFormats;

  function GetBirthDay(input : in String; day : out Day_Number; month : out Month_Number; 
                       year : out Year_Number; today_day : in Day_Number; 
                       today_month : in Month_Number; today_year : in Year_Number)
                         return InputStatus is
    fitsFormat : InputStatus := Good;
  begin
    fitsFormat := GetDate(GetDateFormats, input, day, month, year);
    if fitsFormat = Absurd then
      return Absurd;
    end if;
    if year > today_year then
      return Absurd;
    end if;
    if year = today_year then
      if month > today_month or (month = today_month and day > today_day) then
        return Absurd;
      end if;
    end if;
    return Good;
  end GetBirthDay;

end DateInput;
