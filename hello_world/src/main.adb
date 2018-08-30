with Ada.Text_IO; use Ada.Text_IO;
procedure Main is
begin
   loop
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
