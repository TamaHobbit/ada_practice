with Ada.Text_IO;

procedure Main is

   subtype Foo is Integer range 5..12;
   type Vector is array (Integer range <>) of Float;
   type Matrix is array (Integer range <>, Foo range <>) of Float;

   function "*"(A,B : Vector) return Matrix is
   begin
      return C : Matrix(A'Range, B'Range) do
         for I in A'Range loop
            for J in B'Range loop
               C(I,J) := A(I)*B(J);
            end loop;
         end loop;
      end return;
   end "*";

   A : Vector := (0.0, 1.0, 2.0);
   B : Vector := (5 => 1.0, 6 => 2.0, 7 => 3.0);

   procedure PrintMatrix(M : Matrix) is
   begin
      for J in M'Range(2) loop
         for I in M'Range(1) loop
            Ada.Text_IO.Put(M(I,J)'Image);
         end loop;
         Ada.Text_IO.New_Line;
      end loop;
   end PrintMatrix;

   C : Matrix := A*B;

   function GCD(X,Y : in Integer) return Integer is
   begin
      declare
         X : Integer := GCD.X;
         Y : Integer := GCD.Y;
      begin
         while Y /= 0 loop
            declare
               temp : Integer := X;
            begin
               X := GCD.Y;
               Y := temp mod Y;
            end;
         end loop;
         return X;
      end;
   end GCD;

   type Bar is new Integer;
   function "=" (Left,Right : Bar) return Boolean is
   begin
      return True;
   end "=";
begin
  PrintMatrix(C); 
  Ada.Text_IO.Put_Line("GCD(91,21) = " & GCD(91,21)'Image); 
end Main;
