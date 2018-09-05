with Ada.Strings.Unbounded;  use Ada.Strings.Unbounded;

package StringUtil is

  type String_Array is array (Positive range <>) of Unbounded_String;

  function StringJoin(seperator : in String; strings : in String_Array) return String;

end StringUtil;
