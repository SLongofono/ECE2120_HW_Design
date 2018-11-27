library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and2 is
    Port ( i0 : in STD_LOGIC;
           i1 : in STD_LOGIC;
           O : out STD_LOGIC);
end and2;

-- This basic building block is our 2-input AND gate
architecture Behavioral of and2 is

begin

O <= i0 and i1;

end Behavioral;
