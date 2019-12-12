with Libadalang.Analysis;

procedure Main is
   package LAL renames Libadalang.Analysis;

   Context : constant LAL.Analysis_Context := LAL.Create_Context;
   Unit : LAL.Analysis_Unit := LAL.Get_From_File (Context, "main.adb");
begin
   --LAL.Destroy (Context);
   null;
end Main;

