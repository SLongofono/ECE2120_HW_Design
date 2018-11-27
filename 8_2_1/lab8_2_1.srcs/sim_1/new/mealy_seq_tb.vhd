library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mealy_seq_tb is
--  Port ( );
end mealy_seq_tb;

architecture Behavioral of mealy_seq_tb is

signal t_per: time := 10 ns;
signal s_clk : std_logic := '0';
signal s_ain : std_logic_vector(1 downto 0);
signal s_rst, s_yout: std_logic;

component seq is
   Port ( clk : in STD_LOGIC;
        rst : in STD_LOGIC;
        ain : in STD_LOGIC_VECTOR (1 downto 0);
        yout : out STD_LOGIC);
end component;


begin

uut: seq
    port map(
        clk => s_clk,
        rst => s_rst,
        ain => s_ain,
        yout => s_yout
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

s_rst <= '1';
s_ain <= "00";
wait for t_per;
wait for t_per;

s_rst <= '0';
s_ain <= "00";
wait for t_per;
wait for t_per;

s_ain <= "11";
wait for t_per;

s_ain <= "10";
wait for t_per;

s_ain <= "00";
wait for t_per;
wait for t_per;

s_ain <= "10";
wait for t_per;

s_ain <= "00";
wait for t_per;

s_ain <= "11";
wait for t_per;

s_ain <= "00";
wait for t_per;

s_ain <= "01";
wait for t_per;

s_ain <= "00";
wait for t_per;

s_ain <= "10";
wait for t_per;

s_ain <= "11";
wait for t_per;

s_ain <= "00";
wait for t_per;

wait;

end process;

end Behavioral;
