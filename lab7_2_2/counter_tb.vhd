library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity counter_tb is
--  Port ( );
end counter_tb;

architecture Behavioral of counter_tb is

component counter8d is
    Port ( clk : in STD_LOGIC;
       en : in STD_LOGIC;
       clr : in STD_LOGIC;
       q : out STD_LOGIC_VECTOR (7 downto 0));
end component;

constant t_per:time := 10 ns;
signal clk_int : std_logic := '0';
signal enable_int, clear_n_int: std_logic;
signal q_int: std_logic_vector(7 downto 0);

begin
uut: counter8d
    port map(
        clk => clk_int,
        en => enable_int,
        clr => clear_n_int,
        q => q_int
    );

tiktok:process
begin
wait for t_per/2;
clk_int <= not clk_int;
wait for t_per/2;
clk_int <= not clk_int;
end process;

main: process
begin
enable_int <= '0';
clear_n_int <= '0';
wait for t_per;
wait for t_per;

enable_int <= '1';
wait for t_per;
wait for t_per;

clear_n_int <= '1';
wait for t_per;
wait for t_per;
wait for t_per;
wait for t_per;
wait for t_per;
wait for t_per;
wait for t_per;
wait for t_per;
wait for t_per;

enable_int <= '0';
wait for t_per;
wait for t_per;
wait for t_per;
wait for t_per;
wait for t_per;
wait for t_per;
wait for t_per;
wait for t_per;

enable_int <= '1';

wait;
end process;


end Behavioral;
