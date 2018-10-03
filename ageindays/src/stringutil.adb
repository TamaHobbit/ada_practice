pragma Ada_2012;
package body StringUtil is

  function IntegerToString(number : in Integer) return String is
    image : String := Integer'Image(number);
  begin
    return image(2..image'Length);
  end IntegerToString;

  function StringJoin(seperator : in String; strings : in String_Array) return String is
  begin
    declare
      Result : Unbounded_String;
    begin
      for i in strings'Range loop
        Append(Result, strings(i));
        if i < strings'Length then
          Append(Result, seperator);
        end if;
      end loop;
      return To_String(Result);
    end;
  end StringJoin;

end StringUtil;
