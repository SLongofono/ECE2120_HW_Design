library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- This module models a shift register with a parallel output dump
entity parallel_out_sr is
    Port ( clk : in STD_LOGIC;
           shift_in : in STD_LOGIC;
           shift_en : in STD_LOGIC;
           shift_out : out STD_LOGIC;
           parallel_out : out STD_LOGIC_VECTOR (3 downto 0));
end parallel_out_sr;

architecture Behavioral of parallel_out_sr is

signal s_reg: std_logic_vector(3 downto 0) := "0000";

begin

process(clk)
begin

if rising_edge(clk) then

    if('1' = shift_en) then
        s_reg <= s_reg(2 downto 0) & shift_in;
    end if;
    shift_out <= s_reg(3);
    parallel_out <= s_reg;

end if;

end process;

end Behavioral;
