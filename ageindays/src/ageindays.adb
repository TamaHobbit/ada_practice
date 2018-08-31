with Ada.Text_IO;           use Ada.Text_IO;
with GNAT.Regpat;           use GNAT.Regpat;
with Ada.Strings.Bounded;   use Ada.Strings.Bounded;
with Ada.Strings.Unbounded; use Ada.Strings.unbounded;

procedure Ageindays is

   -- TODO get this into a seperate package
   type String_Array is array (Positive range <>) of Unbounded_String;

   function StringJoin(strings : in String_Array) return String is
   begin
      declare
      begin
         return "";
      end;
   end StringJoin;









   package Month_String is new Ada.Strings.Bounded.Generic_Bounded_Length(9);

   function IntegerToString(number : in Integer) return String is
   begin
      declare
         image : String := number'Image;
      begin
         return image(2..image'Length);
      end;
   end IntegerToString;

   type Month_String_Array is array (1..12) of Month_String.Bounded_String;

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

begin
   Put_Line("What is your birthday?");
   Put_Line("Supported formats by example:");
   Put_Line("24th of September 1992");
   declare
      Re : constant Pattern_Matcher := Compile("(^(1|2)?\d)(th|nd|rd) of (January|February|March|April|May|June|July|August|September|October|November|December) (\d{4})$");
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
               Put_Line(IntegerToString(Day) & '/' & Month_String.To_String(Month) & '/' & IntegerToString(Year));
            end if;
         end;
      end loop;
   end;
end Ageindays;
