library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mod3_tb is
--  Port ( );
end mod3_tb;

architecture Behavioral of mod3_tb is

constant t_per: time := 10 ns;
signal s_clk: std_logic := '0';
signal s_ain, s_yout, s_rst : std_logic;
signal s_count: std_logic_vector(3 downto 0);

component mod3_FSM is
    Port ( ain : in STD_LOGIC;
           yout : out STD_LOGIC;
           clk : in STD_LOGIC;
           c: out std_logic_vector(3 downto 0);
           reset : in STD_LOGIC);
end component;

begin

uut:mod3_FSM
    port map(
        ain => s_ain,
        yout => s_yout,
        clk => s_clk,
        c => s_count,
        reset => s_rst
    );

tiktok: process
begin
wait for t_per/2;
s_clk <= not s_clk;
wait for t_per/2;
s_clk <= not s_clk;
end process;

main: process
begin

s_ain <= '0';
s_rst <= '1';
wait for t_per;

s_rst <= '0';
wait for t_per;

s_ain <= '1';
wait for t_per;
s_ain <= '1';
wait for t_per;
s_ain <= '1';
wait for t_per;
s_ain <= '1';
wait for t_per;
s_ain <= '1';
wait for t_per;
s_ain <= '1';
wait for t_per;

s_ain <= '1';
wait for t_per;
s_ain <= '1';
wait for t_per;
s_ain <= '0';
wait for t_per;
s_ain <= '1';
wait for t_per;
s_ain <= '1';
wait for t_per;
s_ain <= '1';
wait for t_per;
s_ain <= '0';
wait for t_per;
s_ain <= '1';
wait for t_per;
s_ain <= '1';
s_rst <= '1';
wait for t_per;
s_ain <= '1';
wait for t_per;
s_rst <= '0';
s_ain <= '1';
wait for t_per;
s_ain <= '0';
wait for t_per;
s_ain <= '0';
wait for t_per;
s_ain <= '1';
wait for t_per;
s_ain <= '0';
wait for t_per;
s_ain <= '1';
wait for t_per;
s_ain <= '0';

wait;
end process;

end Behavioral;
