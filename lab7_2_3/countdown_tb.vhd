library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity countdown_tb is
--  Port ( );
end countdown_tb;

architecture Behavioral of countdown_tb is

component cdown is
    port(
            clk : in STD_LOGIC;
           clear : in STD_LOGIC;
           load : in STD_LOGIC;
           enable : in STD_LOGIC;
           q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

constant t_per: time := 10 ns;

signal clk_int: std_logic := '0';
signal clear_int, load_int, enable_int: std_logic;
signal q_int: std_logic_vector(3 downto 0);

begin

uut: cdown
    port map(
        clk => clk_int,
        clear => clear_int,
        load => load_int,
        enable => enable_int,
        q => q_int
    );

tiktok: process
begin
wait for t_per/2;
clk_int <= not clk_int;
wait for t_per/2;
clk_int <= not clk_int;
end process;

main:process
begin

clear_int <= '0';
load_int <= '1';
enable_int <= '0';
wait for t_per;
wait for t_per;

enable_int <= '1';
wait for t_per;
wait for t_per;

clear_int <= '1';
wait for t_per;
wait for t_per;

clear_int <= '0';
wait for t_per;
wait for t_per;

load_int <= '1';
wait for t_per;

load_int <= '0';
wait;


end process;
end Behavioral;
