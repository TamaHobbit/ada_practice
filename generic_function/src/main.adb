with Ada.Text_IO; use Ada.Text_IO;

procedure Main is
   type Vector is array (Integer range <>) of Float;

   function Inner(A,B : Vector) return Float is
   begin
      return F : Float := 0.0 do
         for I in A'Range loop
            F := F + A(I)*B(I);
         end loop;
      end return;
   end Inner;

   generic
      type VectorType is private;
      with function FirstOf(V : VectorType) return Integer;
      with function LastOf(V : VectorType) return Integer;
      with function Element(V : VectorType; I : Integer) return Float;
   function InnerChecked(A,B : VectorType) return Float;

   function InnerChecked(A,B : VectorType) return Float is
   begin
      return F : Float := 0.0 do
         for I in FirstOf(A)..LastOf(A) loop
            F := F + Element(A,I)*Element(B,I);
         end loop;
      end return;
   end InnerChecked;

   A : Vector := (0.0, 1.0, 2.0);
   B : Vector := (1.0, 2.0, 3.0);
begin
   Put_Line(Inner(A,B)'Image);
end Main;
