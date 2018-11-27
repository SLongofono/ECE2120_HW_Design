library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity dlatch_tb is
--  Port ( );
end dlatch_tb;

architecture Behavioral of dlatch_tb is

component dlatch is
    Port ( d : in STD_LOGIC;
       clk : in STD_LOGIC;
       rst: in STD_LOGIC;
       q : out STD_LOGIC;
       qbar : out STD_LOGIC);
end component;

signal d_int, rst_int, q_int, qbar_int: STD_LOGIC;
signal clk_int: STD_LOGIC := '0';

constant t_per: time := 20 ns;

begin

UUT: dlatch
    port map(
        d => d_int,
        clk => clk_int,
        rst => rst_int,
        q => q_int,
        qbar => qbar_int
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

rst_int <= '0';
d_int <= '0';
wait for t_per;

d_int <= '1';
wait for t_per;

rst_int <= '1';
wait for t_per/4;
rst_int <= '0';
wait for t_per/4;
rst_int <= '1';
wait for t_per/2;
rst_int <= '0';
wait for t_per;

wait for t_per/2;
rst_int <= '1';
d_int <= '0';
wait for t_per/4;
rst_int <= '0';
wait for t_per/4;

wait for t_per;
wait for t_per;
d_int <= '1';
wait for t_per;
d_int <= '0';


wait;
end process;

end Behavioral;
