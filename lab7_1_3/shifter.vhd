library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- This module models a 1-bit deep shift register
entity shifter is
    Port ( clk : in STD_LOGIC;
           shift_in : in STD_LOGIC;
           shift_out : out STD_LOGIC);
end shifter;

architecture Behavioral of shifter is

signal s_reg: std_logic_vector(1 downto 0);

begin

process(clk)
begin

if (rising_edge(clk)) then
    s_reg <= s_reg(0) & shift_in; 
end if;

shift_out <= s_reg(1);

end process;

end Behavioral;
