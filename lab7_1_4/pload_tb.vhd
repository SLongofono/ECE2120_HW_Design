
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pload_tb is
--  Port ( );
end pload_tb;

architecture Behavioral of pload_tb is

signal clk_int: std_logic := '0';
signal load_int, shift_en_int, shift_in_int, shift_out_int: std_logic;
signal parallel_in_int: std_logic_vector(3 downto 0); 
constant t_per: time := 20 ns;

component parallel_load_sr is
   Port ( load : in STD_LOGIC;
        clk : in STD_LOGIC;
        shift_in : in STD_LOGIC;
        shift_en: in STD_LOGIC;
        shift_out : out STD_LOGIC;
        pbus : in STD_LOGIC_VECTOR (3 downto 0));
end component;

begin

uut: parallel_load_sr
    port map(
        load => load_int,
        clk => clk_int,
        shift_en => shift_en_int,
        shift_in => shift_in_int,
        shift_out => shift_out_int,
        pbus => parallel_in_int
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

load_int <= '0';
shift_in_int <= '1';
shift_en_int <= '0';
parallel_in_int <= "0000";

wait for t_per;
parallel_in_int <= "0101";

wait for t_per;
wait for t_per;
load_int <= '1';
wait for t_per;
load_int <= '0';
wait for t_per;
shift_en_int <= '1';
wait for t_per;
wait for t_per;
wait for t_per;
wait for t_per;
parallel_in_int <= "1001";
wait for t_per;
load_int <= '1';
wait for t_per;
load_int <= '0';
wait for t_per;
wait for t_per;
wait for t_per;
load_int <= '1';
wait for t_per;
load_int <= '0';
wait for t_per;


wait;
end process;
end Behavioral;
