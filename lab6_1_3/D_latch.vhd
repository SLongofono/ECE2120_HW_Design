library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- This module implements a simple synchronous d-latch
entity D_latch is
    Port ( D : in STD_LOGIC;
           E : in STD_LOGIC;
           Q : out STD_LOGIC;
           Qbar : out STD_LOGIC);
end D_latch;

architecture Behavioral of D_latch is

begin

main: process(D, E)
begin
    if('1' = E) then
        Q <= D;
        Qbar <= not D;
    end if;
end process;

end Behavioral;
