library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- This module models the synchronous dlatch with clock enable
entity dlatch is
    Port ( d : in STD_LOGIC;
           clk : in STD_LOGIC;
           ce : in STD_LOGIC;
           rst : in STD_LOGIC;
           q : out STD_LOGIC);
end dlatch;

architecture Behavioral of dlatch is

begin

process(clk)
begin

if(rising_edge(clk)) then
    if('1' = rst) then
        q <= '0';
    elsif ('1' = ce) then
        q <= d;
    end if;
end if;

end process;


end Behavioral;
