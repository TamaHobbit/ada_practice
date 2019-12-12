with Ada.Text_IO; use Ada.Text_IO;

procedure Main is
   subtype My_Nine is Integer range 1..9;

   procedure formal_test(A : in out Integer) is
   begin
      A := A + 1; -- not an error
      A := A - 1; -- at the end of the function, the subtype's constraints are checked. Comment this line and it fails
   end formal_test;

   M : My_Nine := 9;
   subtype My_Int is Integer range 5..6;

   procedure Increment(I : in out My_Int) is
   begin
      I := I + 1;--1234;
      I := I + 1;--1234;
      I := I + 1;--1234;
      I := I + 1;--1234;
   end Increment;

   F : Float := Float(Integer'Last - 1000);
   X : My_Int := 5;

   type Vector is array (Integer range <>) of Float;
   A : Vector(1..1) := (others => 1.0);

   procedure P(V: Vector) is
   begin
      A(1) := V(1) + V(1);
      A(1) := V(1) + V(1);
   end P;

   Default : Integer := 0;
   function Default_Value return Integer is
   begin
      Default := Default + 1;
      return Default;
   end Default_Value;

   procedure Accept_Default(I : Integer := Default_Value; J : Integer := Default_Value) is
   begin
      Put_Line(I'Image);
      Put_Line(J'Image);
   end Accept_Default;

begin
   P(A);
   Put_Line(A(1)'Image);
   formal_test(M);
   Increment(X);

   Outer:
   declare
   begin
      Accept_Default;
      Accept_Default;
   end Outer;

end Main;
