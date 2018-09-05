with Ada.Text_IO;            use Ada.Text_IO;
with GNAT.Regpat;            use GNAT.Regpat;
with Ada.Strings.Bounded;    use Ada.Strings.Bounded;
with Ada.Strings.Unbounded;  use Ada.Strings.unbounded;
with StringUtil;             use StringUtil;

procedure Ageindays is

  package Month_String is new Ada.Strings.Bounded.Generic_Bounded_Length(9);

  -- Integer'Image returns a space followed by a string representing the number
  -- IntegerToString returns just the string representing the number
  function IntegerToString(number : in Integer) return String is
  begin
     declare
        image : String := number'Image;
     begin
        return image(2..image'Length);
     end;
  end IntegerToString;

  type Month_Index is range 1..12;
  type Month_String_Array is array (Month_Index'Range) of Month_String.Bounded_String;

  function ToUnboundedStringArray(months : in Month_String_Array) return String_Array is
  begin
    declare
      Result : String_Array(Integer(Month_Index'First)..Integer(Month_Index'Last));
    begin
      for i in Month_Index'Range loop
        Result(Integer(i)) := To_Unbounded_String(Month_String.To_String(months(i)));
      end loop;
      return Result;
    end;
  end ToUnboundedStringArray;

  Months : Month_String_Array := (
                                  Month_String.To_Bounded_String("January"),
                                  Month_String.To_Bounded_String("February"),
                                  Month_String.To_Bounded_String("March"),
                                  Month_String.To_Bounded_String("April"),
                                  Month_String.To_Bounded_String("May"),
                                  Month_String.To_Bounded_String("June"),
                                  Month_String.To_Bounded_String("July"),
                                  Month_String.To_Bounded_String("August"),
                                  Month_String.To_Bounded_String("September"),
                                  Month_String.To_Bounded_String("October"),
                                  Month_String.To_Bounded_String("November"),
                                  Month_String.To_Bounded_String("December")
                                 );

  function GetMonthIndex(monthName : in Month_String.Bounded_String) return Month_Index is
  begin
    for i in Month_Index'Range loop
      if Month_String."="(monthName, Months(i)) then
        return i;
      end if;
    end loop;
    raise Program_Error;
  end GetMonthIndex;

begin
  Put_Line("What is your birthday?");
  Put_Line("Supported formats by example:");
  Put_Line("24th of September 1992");
  declare
    unboundedMonths : String_Array := ToUnboundedStringArray(Months);
    Re : constant Pattern_Matcher := Compile("(^(1|2)?\d)(th|nd|rd) of (" & StringJoin("|", unboundedMonths) & ") (\d{4})$");
  begin
    loop
      declare
        Input : constant String := Get_Line;
        Matches : Match_Array (0..5);
        Day : Integer;
        Month : Month_String.Bounded_String;
        Year : Integer;
      begin
        exit when Input = "";
        Match(Re, Input, Matches);
        if Matches(0) = No_Match then
          Put_Line("No match");
        else
          Day := Integer'Value(Input(Matches(1).First .. Matches(1).Last));
          Month := Month_String.To_Bounded_String(Input(Matches(4).First .. Matches(4).Last));
          Year := Integer'Value(Input(Matches(5).First .. Matches(5).Last));
          if Year < 2018 - 150 then
            Put_Line("Don't be absurd. Tell me your real birthday");
          else
            Put_Line(IntegerToString(Day) & '/' & IntegerToString(Integer(GetMonthIndex(Month))) & '/' & IntegerToString(Year));
          end if;
        end if;
      end;
    end loop;
  end;
end Ageindays;
