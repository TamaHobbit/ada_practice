with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Discrete_Random;

procedure Main is
   Y_size : constant := 10;
   X_size : constant := 18;

   type Directions is (NW, N, NE, W, E, SW, S, SE);
   type Directions_Flag is array (Directions) of Boolean;

   type Cell_State is (Alive, Dead);

   type Neighbour is access constant Cell_State;
   type Neighbour_Array is array (Directions) of Neighbour;

   type Neighbours_Alive_Count is range 0..8;
   type Neighbour_Count_NewState_Mapping is array (Neighbours_Alive_Count) of Cell_State;

   type Cellular_Automaton_Definition is
      record
         Birth_Condition : Neighbour_Count_NewState_Mapping;
         Survive_Condition : Neighbour_Count_NewState_Mapping;
      end record;

   Game_Of_Life : constant Cellular_Automaton_Definition
      := (Birth_Condition => (2|3 => Alive, others => Dead), Survive_Condition => (3 => Alive, others => Dead));

   function Count(Neighbours : Neighbour_Array) return Neighbours_Alive_Count is
     Total : Neighbours_Alive_Count := 0; 
   begin
      for State of Neighbours loop
         if State.all = Alive then
            Total := Total + 1;
         end if;
      end loop;
      return Total;
   end Count;

   type Cell is
      record
         State : aliased Cell_State;
         Neighbours : Neighbour_Array;
      end record;

   Always_Dead : aliased constant Cell_State := Dead;
   Dummy_Dead : constant Neighbour := Always_Dead'Access;

   type Cell_Matrix is array (1..X_size, 1..Y_size) of Cell;

   procedure Print(M : Cell_Matrix) is
   begin
      for y in 1..Y_size loop
         for x in 1..X_size loop
            Put(case M(x,y).State is when Alive => '@', when Dead => ' ');
         end loop;
         Put_Line("");
      end loop;
   end Print;

   type Percentage is range 0..100; 
   type Random_Result is range 1..100;
   package Random_Percent is new Ada.Numerics.Discrete_Random (Random_Result);
   use Random_Percent;
   G : Generator;

   procedure Assign_Random(M : out Cell_Matrix; Fill_Ratio : Percentage) is
   begin
      for y in 1..Y_size loop
         for x in 1..X_size loop
            M(x,y).State := (if Percentage(Random(G)) <= Fill_Ratio then Alive else Dead);
         end loop;
      end loop;
   end Assign_Random;

   M : aliased Cell_Matrix;

   procedure Connect(M : access Cell_Matrix) is
      function Get_Valid_Directions(X : Integer; Y : Integer) return Directions_Flag is
         Valid_Directions : Directions_Flag := (others => false);
      begin
         Valid_Directions(N) := y > 1;
         Valid_Directions(S) := y < Y_size;
         Valid_Directions(W) := x > 1;
         Valid_Directions(E) := x < X_size;
         Valid_Directions(NW) := Valid_Directions(N) or Valid_Directions(W);
         Valid_Directions(NE) := Valid_Directions(N) or Valid_Directions(E);
         Valid_Directions(SW) := Valid_Directions(S) or Valid_Directions(W);
         Valid_Directions(SE) := Valid_Directions(S) or Valid_Directions(E);
         return Valid_Directions;
      end Get_Valid_Directions;

      procedure Apply_Offset(Dir : Directions; X : in out Integer; Y : in out Integer) is
      begin
         case Dir is
            when N =>
               Y := Y - 1;
            when S =>
               Y := Y + 1;
            when W =>
               X := X - 1;
            when E =>
               X := X + 1;
            when NE =>
               Y := Y - 1;
               X := X + 1;
            when SE =>
               Y := Y + 1;
               X := X + 1;
            when NW =>
               Y := Y - 1;
               X := X - 1;
            when SW =>
               Y := Y + 1;
               X := X - 1;
         end case;
      end Apply_Offset;

   begin
      for y in 1..Y_size loop
         for x in 1..X_size loop
            declare
               Current_Cell : Cell := M(x,y);
               Valid_Directions : Directions_Flag := Get_Valid_Directions(X => x, Y => y);
            begin
               for Current_Direction in Current_Cell.Neighbours'range loop
                  declare
                     New_Neighbour : Neighbour;
                  begin
                     if Valid_Directions(Current_Direction) then
                        declare
                           Other_X : Integer range 1..X_size := X;
                           Other_Y : Integer range 1..Y_size := Y;
                        begin
                           Apply_Offset(Current_Direction,Other_X,Other_Y);
                           New_Neighbour := M(Other_X,Other_Y).State'Access;
                        end;
                     else
                        New_Neighbour := Always_Dead'Access;
                     end if;
                     Current_Cell.Neighbours(Current_Direction) := New_Neighbour;
                  end;
               end loop;
            end;
         end loop;
      end loop;
   end Connect;

   function TimeStep(M : in Cell_Matrix) return Cell_Matrix is
      Result : Cell_Matrix := M;
   begin
      for y in 1..Y_size loop
         for x in 1..X_size loop
            declare
               Old_Cell : Cell := M(x,y);
               Neighbours_Count : Neighbours_Alive_Count := Count( Old_Cell.Neighbours );
            begin
               case Old_Cell.State is
                  when Dead =>
                     Result(x,y).State := Game_Of_Life.Birth_Condition(Neighbours_Count);
                  when Alive =>
                     Result(x,y).State := Game_Of_Life.Survive_Condition(Neighbours_Count);
               end case;
            end;
         end loop;
      end loop;
      return Result;
   end TimeStep;

begin
   Connect(M'Access);

   Assign_Random(M, 23);
   Print(M);

   for I in Integer range 1..100 loop
      M := TimeStep(M);
      Print(M);
   end loop;
end Main;
