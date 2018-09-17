--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into StringUtil.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with System.Assertions;
with GNAT.Source_Info;

--  begin read only
--  id:2.2/00/
--
--  This section can be used to add with clauses if necessary.
--
--  end read only

--  begin read only
--  end read only
package body StringUtil.Test_Data.Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

--  begin read only
--  end read only

--  begin read only
   procedure Test_IntegerToString (Gnattest_T : in out Test);
   procedure Test_IntegerToString_213542 (Gnattest_T : in out Test) renames Test_IntegerToString;
--  id:2.2/2135429b0847bdc5/IntegerToString/1/0/
   procedure Test_IntegerToString (Gnattest_T : in out Test) is
   --  stringutil.ads:9:3:IntegerToString
--  end read only
     procedure Check(input : in Integer; expected : in String; 
                     Line : Natural := GNAT.Source_Info.Line) is
       result : String := IntegerToString(input);
       garbage : Boolean;
     begin
       garbage := Assert(result = expected, "Expected: " & expected & 
                                            " Actual: " & result, Line => Line);
     end Check;
   begin
     Check(0, "0");
     Check(1, "1");
     Check(2, "2");
     Check(3, "3");
     Check(4, "4");
     Check(5, "5");
     Check(6, "6");
     Check(7, "7");
     Check(8, "8");
     Check(9, "9");
     Check(10, "10");
     Check(11, "11");
     Check(12, "12");
     Check(13, "13");
     Check(14, "14");
     Check(15, "15");
     Check(16, "16");
     Check(17, "17");
     Check(18, "18");
     Check(19, "19");
     Check(20, "20");
     Check(21, "21");
     Check(22, "22");
     Check(23, "23");
     Check(24, "24");
     Check(25, "25");
     Check(26, "26");
     Check(27, "27");
     Check(28, "28");
     Check(29, "29");
     Check(30, "30");
     Check(31, "31");
     Check(32, "32");
     Check(33, "33");
     Check(34, "34");
     Check(35, "35");

     Check(637, "637");
     Check(638, "638");
     Check(639, "639");
     Check(640, "640");
     Check(641, "641");
     Check(642, "642");
     Check(643, "643");
     Check(644, "644");
     Check(645, "645");
     Check(646, "646");
     Check(647, "647");
     Check(648, "648");
     Check(649, "649");
     Check(650, "650");
     Check(651, "651");
     Check(652, "652");
     Check(653, "653");
     Check(654, "654");
     Check(655, "655");
     Check(656, "656");
     Check(657, "657");
     Check(658, "658");
     Check(659, "659");
     Check(660, "660");
     Check(661, "661");
     Check(662, "662");
     Check(663, "663");
     Check(664, "664");
     Check(665, "665");
     Check(666, "666");
     Check(667, "667");
     Check(668, "668");
     Check(669, "669");
     Check(670, "670");
     Check(671, "671");
     Check(672, "672");
     Check(673, "673");
     Check(674, "674");
     Check(675, "675");
     Check(676, "676");
     Check(677, "677");
     Check(678, "678");
     Check(679, "679");
     Check(680, "680");
     Check(681, "681");
     Check(682, "682");
     Check(683, "683");

     Check(1888, "1888");
     Check(1889, "1889");
     Check(1890, "1890");
     Check(1891, "1891");
     Check(1892, "1892");
     Check(1893, "1893");
     Check(1894, "1894");
     Check(1895, "1895");
     Check(1896, "1896");
     Check(1897, "1897");
     Check(1898, "1898");
     Check(1899, "1899");
     Check(1900, "1900");
     Check(1901, "1901");
     Check(1902, "1902");
     Check(1903, "1903");
     Check(1904, "1904");
     Check(1905, "1905");
     Check(1906, "1906");
     Check(1907, "1907");
     Check(1908, "1908");
     Check(1909, "1909");
     Check(1910, "1910");
     Check(1911, "1911");
     Check(1912, "1912");
     Check(1913, "1913");
     Check(1914, "1914");
     Check(1915, "1915");
     Check(1916, "1916");
     Check(1917, "1917");
     Check(1918, "1918");
     Check(1919, "1919");
     Check(1920, "1920");
     Check(1921, "1921");
     Check(1922, "1922");
     Check(1923, "1923");
     Check(1924, "1924");
     Check(1925, "1925");
     Check(1926, "1926");
     Check(1927, "1927");
     Check(1928, "1928");
     Check(1929, "1929");
     Check(1930, "1930");
     Check(1931, "1931");
     Check(1932, "1932");
     Check(1933, "1933");
     Check(1934, "1934");
     Check(1935, "1935");
     Check(1936, "1936");
     Check(1937, "1937");
     Check(1938, "1938");
     Check(1939, "1939");
     Check(1940, "1940");
     Check(1941, "1941");
     Check(1942, "1942");
     Check(1943, "1943");
     Check(1944, "1944");
     Check(1945, "1945");
     Check(1946, "1946");
     Check(1947, "1947");
     Check(1948, "1948");
     Check(1949, "1949");
     Check(1950, "1950");
     Check(1951, "1951");
     Check(1952, "1952");
     Check(1953, "1953");
     Check(1954, "1954");
     Check(1955, "1955");
     Check(1956, "1956");
     Check(1957, "1957");
     Check(1958, "1958");
     Check(1959, "1959");
     Check(1960, "1960");
     Check(1961, "1961");
     Check(1962, "1962");
     Check(1963, "1963");
     Check(1964, "1964");
     Check(1965, "1965");
     Check(1966, "1966");
     Check(1967, "1967");
     Check(1968, "1968");
     Check(1969, "1969");
     Check(1970, "1970");
     Check(1971, "1971");
     Check(1972, "1972");
     Check(1973, "1973");
     Check(1974, "1974");
     Check(1975, "1975");
     Check(1976, "1976");
     Check(1977, "1977");
     Check(1978, "1978");
     Check(1979, "1979");
     Check(1980, "1980");
     Check(1981, "1981");
     Check(1982, "1982");
     Check(1983, "1983");
     Check(1984, "1984");
     Check(1985, "1985");
     Check(1986, "1986");
     Check(1987, "1987");
     Check(1988, "1988");
--  begin read only
   end Test_IntegerToString;
--  end read only


--  begin read only
   procedure Test_StringJoin (Gnattest_T : in out Test);
   procedure Test_StringJoin_7d3099 (Gnattest_T : in out Test) renames Test_StringJoin;
--  id:2.2/7d3099cf2d3612b1/StringJoin/1/0/
   procedure Test_StringJoin (Gnattest_T : in out Test) is
   --  stringutil.ads:11:3:StringJoin
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_StringJoin;
--  end read only

--  begin read only
--  id:2.2/02/
--
--  This section can be used to add elaboration code for the global state.
--
begin
--  end read only
   null;
--  begin read only
--  end read only
end StringUtil.Test_Data.Tests;
