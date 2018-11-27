library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- This module implements a 2-bit multiplier using a Lookup table stored in a ROM
entity mulROM is
    Port ( a : in STD_LOGIC_VECTOR (1 downto 0);
           b : in STD_LOGIC_VECTOR (1 downto 0);
           product : out STD_LOGIC_VECTOR (3 downto 0));
end mulROM;

architecture Behavioral of mulROM is

type ROM is array(0 to 15) of std_logic_vector(3 downto 0);
constant myROM: ROM := (
    0 => "0000",
    1 => "0000",
    2 => "0000",
    3 => "0000",
    4 => "0000",
    5 => "0001",
    6 => "0010",
    7 => "0011",
    8 => "0000",
    9 => "0010",
    10 => "0100",
    11 => "0110",
    12 => "0000",
    13 => "0011",
    14 => "0110",
    15 => "1001"
    );

signal addr: std_logic_vector(3 downto 0);

begin

addr <= a & b;
product <= myROM(to_integer(unsigned(addr)));

end Behavioral;
