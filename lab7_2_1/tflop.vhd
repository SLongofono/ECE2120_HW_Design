library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- This module implements a one-bit toggle latch
entity tflop is
    Port ( t : in STD_LOGIC;
           clk : in STD_LOGIC;
           clr : in STD_LOGIC;
           q : out STD_LOGIC);
end tflop;

architecture Behavioral of tflop is

signal q_last: std_logic;

begin

process(clk, clr)
begin

-- Aynchronous, negative logic clear
if ('0' = clr) then
    q_last <= '0';
elsif rising_edge(clk) then
    if('1' = t) then
        q_last <= not q_last;
    end if;
    
end if;


end process;

q <= q_last;

end Behavioral;
