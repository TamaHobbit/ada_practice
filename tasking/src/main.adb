with Ada.Text_IO; use Ada.Text_IO;

procedure Main is
  task First;
  task Second;

  task body First is
  begin
    delay 0.5;
    Put_Line("First");
  end First;

  task body Second is
  begin
    delay 1.5;
    Put_Line("Second");
  end Second;
begin
  Put_Line("Main");
end Main;
