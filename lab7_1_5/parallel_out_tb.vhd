
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity parallel_out_tb is
--  Port ( );
end parallel_out_tb;

architecture Behavioral of parallel_out_tb is

signal clk_int: std_logic := '0';
signal shift_in_int, shift_out_int, shift_en_int : std_logic;
signal parallel_out_int: std_logic_vector(3 downto 0);

component parallel_out_sr is
      Port ( clk : in STD_LOGIC;
         shift_in : in STD_LOGIC;
         shift_en : in STD_LOGIC;
         shift_out : out STD_LOGIC;
         parallel_out : out STD_LOGIC_VECTOR (3 downto 0));
end component;

constant t_per: time := 20 ns;

begin

uut: parallel_out_sr
    port map(
        clk => clk_int,
        shift_en => shift_en_int,
        shift_in => shift_in_int,
        shift_out => shift_out_int,
        parallel_out => parallel_out_int
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

shift_in_int <= '1';
shift_en_int <= '0';
wait for t_per;
wait for t_per;

shift_en_int <= '1';
wait for t_per;
wait for t_per;

shift_en_int <= '0';
wait for t_per;
wait for t_per;

shift_en_int <= '1';
wait for t_per;
wait for t_per;

shift_en_int <= '0';

wait for t_per;
wait for t_per;
wait for t_per;
wait for t_per;


wait;
end process;

end Behavioral;
