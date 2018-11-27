library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- This module implements a 2-bit comparison via a lookup table, implemented as a ROM
entity bitcomp is
    Port ( a : in STD_LOGIC_VECTOR (1 downto 0);
           b : in STD_LOGIC_VECTOR (1 downto 0);
           op : out STD_LOGIC_VECTOR (2 downto 0));
end bitcomp;

architecture Behavioral of bitcomp is

-- Define our ROM as an array type
type ROM is array(0 to 15) of std_logic_vector(2 downto 0);

-- Make a ROM to use with an initialized value
constant myROM : ROM := 
(   0 =>"001", 
    1 =>"100", 
    2 =>"100",
    3 =>"100",
    4 =>"010",
    5 =>"001",
    6 =>"100",
    7 =>"100",
    8 =>"010",
    9 =>"010",
    10 =>"001",
    11 =>"100",
    12 =>"010",
    13 =>"010",
    14 =>"010",
    15 =>"001"
);

-- Use to index our array
signal addr: std_logic_vector(3 downto 0) := "0000";

begin

addr <= b & a;
op <= myROM(to_integer(unsigned(addr)));


end Behavioral;
