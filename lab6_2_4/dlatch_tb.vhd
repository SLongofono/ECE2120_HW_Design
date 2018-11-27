library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dlatch_tb is
--  Port ( );
end dlatch_tb;

architecture Behavioral of dlatch_tb is

component dlatch is
    Port ( d : in STD_LOGIC;
       clk : in STD_LOGIC;
       ce : in STD_LOGIC;
       rst : in STD_LOGIC;
       q : out STD_LOGIC);
end component;

signal clk_int: STD_LOGIC := '0';
signal d_int, ce_int, rst_int, q_int: STD_LOGIC;
constant t_per: time := 20 ns;

begin
UUT: dlatch
    port map(
        d => d_int,
        clk => clk_int,
        ce => ce_int,
        rst => rst_int,
        q => q_int
    );

tiktok: process
begin
wait for t_per/2;
clk_int <= not clk_int;
wait for t_per/2;
clk_int <= not clk_int;

end process;

main: process
begin

d_int <= '0';
ce_int <= '0';
rst_int <= '0';
wait for t_per;
d_int <= '1';
wait for t_per;
wait for t_per;

ce_int <= '1';
wait for t_per;
ce_int <= '0';
wait for t_per;
d_int <= '0';
wait for t_per;

rst_int <= '1';
wait for t_per;
rst_int <= '0';
wait for t_per;
wait for t_per;

ce_int <= '1';
wait for t_per;
ce_int <= '0';
wait for t_per;

wait;
end process;

end Behavioral;
