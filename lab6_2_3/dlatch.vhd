library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- This module models a synchronous dlatch with a synchronous reset
entity dlatch is
    Port ( d : in STD_LOGIC;
           clk : in STD_LOGIC;
           rst: in STD_LOGIC;
           q : out STD_LOGIC;
           qbar : out STD_LOGIC);
end dlatch;

architecture Behavioral of dlatch is

begin
main: process(clk, rst)
begin
    if(rising_edge(clk)) then
        if('1' = rst) then
            q <= '0';
            qbar <= '1';
        else
            q <= d;
            qbar <= not d;
        end if;
    end if;
end process;

end Behavioral;
