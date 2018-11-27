library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity regsync_tb is
--  Port ( );
end regsync_tb;

architecture Behavioral of regsync_tb is

signal clk_int: std_logic := '0';
signal rst_int, load_int: std_logic;
signal q_int, d_int: std_logic_vector(3 downto 0);
constant t_per: time := 20 ns;

component register_synch_load is
   Port ( d : in STD_LOGIC_VECTOR (3 downto 0);
        q : out STD_LOGIC_VECTOR (3 downto 0);
        load : in STD_LOGIC;
        clk : in STD_LOGIC;
        rst : in STD_LOGIC);
end component;

begin

uut: register_synch_load
    port map(
        d => d_int,
        q => q_int,
        load => load_int,
        clk => clk_int,
        rst => rst_int
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

d_int <= "0000";
rst_int <= '0';
load_int <= '0';

wait for t_per;
d_int <= "0101";
wait for t_per;
wait for t_per;
load_int <= '1';

wait for t_per;
load_int <= '0';

wait for t_per;
d_int <= "1001";

wait for t_per;
wait for t_per;
load_int <= '1';

wait for t_per;
load_int <= '0';

wait for t_per;
rst_int <= '1';

wait for t_per;
wait for t_per;
load_int <= '1';

wait for t_per;
load_int <= '0';
wait for t_per;
rst_int <= '0';



wait;
end process;

end Behavioral;
