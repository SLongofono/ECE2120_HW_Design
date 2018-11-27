library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity not1 is
    Port ( i : in STD_LOGIC;
           o : out STD_LOGIC);
end not1;

-- This basic building block implements the not gate.
architecture Behavioral of not1 is

begin

o <= not i;

end Behavioral;
