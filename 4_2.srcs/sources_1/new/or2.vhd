library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity or2 is
    Port ( i0 : in STD_LOGIC;
           i1 : in STD_LOGIC;
           O : out STD_LOGIC);
end or2;

-- This basic building block is our 2-input OR gate
architecture Behavioral of or2 is

begin

O <= i0 or i1;

end Behavioral;
