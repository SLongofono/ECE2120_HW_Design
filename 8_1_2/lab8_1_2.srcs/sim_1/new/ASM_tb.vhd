library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ASM_tb is
--  Port ( );
end ASM_tb;

architecture Behavioral of ASM_tb is

constant t_per: time := 10 ns;
signal s_start, s_done: std_logic;
signal s_multiplicand, s_multiplier: std_logic_vector(2 downto 0);
signal s_product: std_logic_vector(5 downto 0);
signal s_clk: std_logic:= '0';

component mult is
    Port ( clk : in STD_LOGIC;
       start : in STD_LOGIC;
       done : out STD_LOGIC;
       multiplicand : in STD_LOGIC_VECTOR (2 downto 0);
       multiplier : in STD_LOGIC_VECTOR (2 downto 0);
       product : out STD_LOGIC_VECTOR (5 downto 0));
end component;

begin
uut: mult
    port map(
        clk => s_clk,
        start => s_start,
        done => s_done,
        multiplicand => s_multiplicand,
        multiplier => s_multiplier,
        product => s_product
    );

tiktok: process
begin
wait for t_per/2;
s_clk <= not s_clk;
end process;

main:process
begin
s_multiplicand <= "111";
s_multiplier <= "101";
s_start <= '0';
wait for 3*t_per;

s_start <= '1';
wait for t_per;
s_start <= '0';

wait for 10*t_per;
s_start <= '1';
s_multiplicand <= "100";
s_multiplier <= "001";
wait for 12*t_per;
s_start <= '0';

wait;
end process;

end Behavioral;
