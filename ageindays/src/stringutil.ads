with Ada.Strings.Unbounded;  use Ada.Strings.Unbounded;

package StringUtil is

  type String_Array is array (Positive range <>) of Unbounded_String;

  -- Integer'Image returns a space followed by a string representing the number
  -- IntegerToString returns just the string representing the number
  function IntegerToString(number : in Integer) return String;

  function StringJoin(seperator : in String; strings : in String_Array) return String;

end StringUtil;
