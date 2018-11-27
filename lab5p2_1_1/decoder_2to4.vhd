library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- This module implements a 2 to 4 decoder with an active-low enable, per the
-- implementation of the 74LS138
entity decoder_2to4 is
    Port ( en : in STD_LOGIC;
           x : in STD_LOGIC_VECTOR (1 downto 0);
           y : out STD_LOGIC_VECTOR (3 downto 0));
end decoder_2to4;

architecture Behavioral of decoder_2to4 is

begin

y(0) <= '1' when en = '1' else not ((not x(0)) and (not x(1)));
y(1) <= '1' when en = '1' else not ((not x(1)) and x(0));
y(2) <= '1' when en = '1' else not (x(1) and (not x(0)));
y(3) <= '1' when en = '1' else not (x(0) and x(1));

end Behavioral;
