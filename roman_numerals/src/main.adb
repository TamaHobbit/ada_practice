with Ada.Text_IO; use Ada.Text_IO;

procedure Main is

   type Roman_Digit is ('I', 'V', 'X', 'L', 'C', 'D', 'M');

   function Value(R : Roman_Digit) return Integer is
      Roman_Digit_To_Integer : constant array (Roman_Digit) of Integer := ('I' => 1, 'V' => 5, 'X' => 10, 'L' => 50, 'C' => 100, 'D' => 500, 'M' => 1000);
   begin
      return Roman_Digit_To_Integer(R);
   end Value;

   function Image(R : Roman_Digit) return Character is
      Roman_Digit_To_Character : constant array (Roman_Digit) of Character := ('I' => 'I', 'V' => 'V', 'X' => 'X', 'L' => 'L', 'C' => 'C', 'D' => 'D', 'M' => 'M');
   begin
      return Roman_Digit_To_Character(R);
   end Image;

   type Roman_Number is array (Positive range <>) of Roman_Digit;

   function Image(number : Roman_Number) return String is
   begin
      return S : String(number'Range) do
         for index in number'Range loop
            S(index) := Image(number(index));
         end loop;
      end return;
   end Image;

   function Value(R : Roman_Number) return Integer is
      Result : Integer := 0;
      index : Positive := R'First;
   begin
      while index < R'Last loop
         declare
            Val : Integer := Value(R(index));
            NextVal : Integer := Value(R(index+1));
         begin
            if Val >= NextVal then
               Result := Result + Val;
               index := index + 1;
            else
               Result := Result + (NextVal - Val);
               index := index + 2;
            end if;
         end;
      end loop;
      if index = R'Last then
         Result := Result + Value(R(index));
      end if;
      return Result;
   end Value;

   type Roman_Number_Array is array (Integer range <>) of access Roman_Number;
   Numerals_To_Test : Roman_Number_Array := (
                                             new Roman_Number'("IV"),
                                             new Roman_Number'("V"),
                                             new Roman_Number'("MC"),
                                             new Roman_Number'("MCM"),
                                             new Roman_Number'("MCDXLIV"),
                                             new Roman_Number'("MCMLXXXIV"),
                                             new Roman_Number'("MMMMMMMM")
                                            );

   function "<" (Left, Right : Roman_Number) return Boolean is
      (Value(Left) < Value(Right));

begin

   for N of Numerals_To_Test loop
      declare
         R : Roman_Number := N.all;
      begin
         Put_Line(Image(R) & " = " & Value(R)'Image);
      end;
   end loop;

   declare
      A : Roman_Number := "XLIX";
      B : Roman_Number := "L";
      R : Boolean := A < B;
   begin
      Put_Line(Image(A) & " < " & Image(B) & " : " & R'Image);
   end;
end Main;
