library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- This module models a 4-bit deep shift register with a parallel load
entity parallel_load_sr is
    Port ( load : in STD_LOGIC;
           clk : in STD_LOGIC;
           shift_in : in STD_LOGIC;
           shift_en: in STD_LOGIC;
           shift_out : out STD_LOGIC;
           pbus : in STD_LOGIC_VECTOR (3 downto 0));
end parallel_load_sr;

architecture Behavioral of parallel_load_sr is

signal s_reg: std_logic_vector(3 downto 0);

begin

process(clk)
begin

if rising_edge(clk) then
    if('1' = load) then
        s_reg <= pbus;
    elsif('1' = shift_en) then
        s_reg <= s_reg(2 downto 0) & shift_in;
    end if;
    
    shift_out <= s_reg(3);
end if;
end process;
end Behavioral;
