library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- This module models a simple synchronous dlatch
entity dflop is
    Port ( d : in STD_LOGIC;
           clk : in STD_LOGIC;
           clr: in STD_LOGIC;
           q : out STD_LOGIC);
end dflop;

architecture Behavioral of dflop is
begin

process(clk, clr)
begin

if('0' = clr) then
    q <= '0';
elsif(rising_edge(clk)) then
    q <= d;
end if;

end process;

end Behavioral;
