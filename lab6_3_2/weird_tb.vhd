library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- This testbench produces the waveform shown in section 3-1.  The instructions were unclear, but I did exactly as asked.
entity weird_tb is
--  Port ( );
end weird_tb;

architecture Behavioral of weird_tb is

signal A, G1, G2: STD_LOGIC;

begin

process
begin

A <= '0';
G1 <= '0';
G2 <= '1';

wait for 40 ns;
A <= '1';
wait for 20 ns;
G1 <= '1';
wait for 20 ns;
G2 <= '0';
wait for 20 ns;
A <= '0';
wait for 20 ns;
G1 <= '0';
wait for 20 ns;
G2 <= '1';
wait; 


end process;

end Behavioral;
