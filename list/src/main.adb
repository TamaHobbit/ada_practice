with Ada.Text_IO; use Ada.Text_IO;

procedure Main is

   type Cell;
   type Cell_Ptr is access Cell;
   subtype NotNull_Cell_Ptr is not null Cell_Ptr;

   type Cell is
      record
         Next : Cell_Ptr;
         Value : Integer;
      end record;

   procedure Add_To_list(List : in out Cell_Ptr; V : in Integer) is
   begin
      List := new Cell'(List, V);
   end Add_To_list;

   procedure Append(First : in out Cell_Ptr; Second : in Cell_Ptr) is
   begin
      if First = null then
         First := Second;
      else
         declare
            function EndOf(L : in NotNull_Cell_Ptr) return Cell_Ptr is
            begin
               declare
                  L : Cell_Ptr := EndOf.L;
               begin
                  while L.Next /= null loop
                     L := L.Next;
                  end loop;
                  return L;
               end;
            end EndOf;
            End_Of_First : Cell_Ptr := EndOf(First);
         begin
            End_Of_First.Next := Second;
         end;
      end if;
   end Append;

   procedure Print(First : in out Cell_Ptr) is
      Local : Cell_Ptr := First;
   begin
      while Local /= null loop
         Put_Line(Local.Value'Image);
         Local := Local.Next;
      end loop;
   end Print;

   L : Cell_Ptr := null;--new Cell'(new Cell'(new Cell'(null, 3), 2), 1);
   M : Cell_Ptr := new Cell'(new Cell'(new Cell'(null, 6), 5), 4);
begin
   Append(L, M);
   Print(L);

   declare
      type Ref_Pos is access Positive;
      RP : Ref_Pos := new Integer'(1);

      type String_Ptr is not null access constant String;
      A_String : aliased String := "Hello";
      SP : constant String_Ptr := A_String'Access;
   begin
      SP.all := "Howdy";
      null;
   end;
end Main;
