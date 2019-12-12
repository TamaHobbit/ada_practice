with Ada.Text_IO; use Ada.Text_IO;

procedure Main is
   type Spirit is (Gin, Vodka);
   type Style is (On_The_Rocks, Straight_Up);
   type Trimming is (Olive, Twist);

   type Day is (Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday);
   subtype Weekend is Day range Saturday..Sunday;

   Today : Day := Monday;

   function Default_Spirit return Spirit is 
      (case Today is when Weekend'Range => Vodka,
                     when Monday..Friday => Gin);

   procedure Dry_Martini(Base : Spirit := Default_Spirit;
                         How : Style := On_The_Rocks;
                         Plus : Trimming := Olive) is
   begin
      null;
   end Dry_Martini;

   procedure Foo(I : Integer; J : Integer := 0) is
   begin
      Put_Line("Foo(I,J) called");
   end Foo;

   procedure Foo(I : Integer) is
   begin
      Put_Line("Foo(I) called");
   end Foo;

begin
   null;
end Main;
