    with Ada.Strings.Unbounded;  use Ada.Strings.Unbounded;
    
    procedure Main is
    
      function "+"(S: String) return Ada.Strings.Unbounded.Unbounded_String
        renames Ada.Strings.Unbounded.To_Unbounded_String;
    
      type String_Array is array (Positive range <>) of Unbounded_String;
    
      procedure Foo(input : in String_Array) is
      begin
        null;
      end Foo;
    
    begin
      Foo((+"one", +"two"));                                    --(1)
      --Foo((+"only"));                                         --(2) positional aggregate cannot have one component
      Foo((1 => +"only"));                                      --(3)
      --Foo((String_Array'First => +"only"));                   --(4) prefix for "First" attribute must be constrained array
      --Foo((String_Array'Range => +"only"));                   --(5) prefix for "Range" attribute must be constrained array
      --Foo((String_Array'Range'First => +"only"));             --(6) range attribute cannot be used in expression
      --Foo((String_Array'Range'Type_Class'First => +"only"));  --(7) range attribute cannot be used in expression
    end Main;
