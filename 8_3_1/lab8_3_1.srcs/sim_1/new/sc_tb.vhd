library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sc_tb is
--  Port ( );
end sc_tb;

architecture Behavioral of sc_tb is
constant t_per: time := 10 ns;
signal s_clk : std_logic := '0';
signal s_rst: std_logic := '0';
signal s_led: std_logic_vector(2 downto 0);

component counts is
    Port ( clk : in STD_LOGIC;
       rst : in STD_LOGIC;
       led : out STD_LOGIC_VECTOR (2 downto 0));
end component;

begin

uut: counts
    port map(
        clk => s_clk,
        rst => s_rst,
        led => s_led
    );

tiktok: process
begin
wait for t_per/2;
s_clk <= not s_clk;
end process;

main: process
begin

s_rst <= '1';
wait for 2*t_per;
s_rst <= '0';
wait for 10*t_per;
s_rst <= '1';
wait for 2*t_per;
s_rst <= '0';



wait;

end process;

end Behavioral;
