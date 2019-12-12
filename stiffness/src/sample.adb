WITH Ada.Text_IO;
WITH Ada.Long_Float_Text_IO;
WITH Material_Data;
USE Material_Data;

PROCEDURE sample IS

   Stiffness_Ratio  : Long_Float;
   Actual_Stiffness : CONSTANT Long_Float :=  Stiffness_Ratio * Stiffness_Total;

BEGIN -- main program
   Ada.Text_IO.Put("Enter stiffness ratio: ");
   Ada.Long_Float_Text_IO.Get(Item => Stiffness_Ratio);
   Ada.Long_Float_Text_IO.Put(Item => Stiffness_Ratio);

   --Ada.Text_IO.New_Line;
   --Ada.Long_Float_Text_IO.Put(Item => Actual_Stiffness);
   --Ada.Text_IO.New_Line;
   --Ada.Long_Float_Text_IO.Put(Item => Stiffness_Total);
END sample;
