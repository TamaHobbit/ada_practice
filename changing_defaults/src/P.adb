package body P is
   procedure Call_It(I : Integer := 0) is
   begin
      Put_Line(I'Image);
   end Call_It;
end P;

