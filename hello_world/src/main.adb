with Ada.Text_IO; use Ada.Text_IO;

procedure Main is

  type Instance (Immutable : Positive) is record
    Mutable : Integer;
  end record;

  A : Instance := (Immutable => 1, Mutable => 2);

begin
   loop
      Put(A.Immutable'Image);
      A.Mutable := 4;
      Put_Line("What is your name?");
      declare
         Name : String := Get_Line;
      begin
         exit when Name = "";
         Put_Line("Hi " & Name & "!");
      end;
      Ada.Text_IO.Put_line("Bye!");
   end loop;
end Main;
