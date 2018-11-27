library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity dlatch_tb is
--  Port ( );
end dlatch_tb;

architecture Behavioral of dlatch_tb is

signal t_per: time := 10 ns;
signal clk_int: std_logic := '0';
signal d_int, q_int, qbar_int: std_logic_vector(2 downto 0);

component top is
 Port ( d : in STD_LOGIC_VECTOR (2 downto 0);
          clk : in STD_LOGIC;
          q : out STD_LOGIC_VECTOR (2 downto 0);
          qbar : out STD_LOGIC_VECTOR (2 downto 0));
end component;

begin

UUT: top
    port map(
        d => d_int,
        clk => clk_int,
        q => q_int,
        qbar => qbar_int
    );

main: process
begin

-- Steady state/settling
clk_int <= '1';
d_int <= "000";
wait for t_per/2;
clk_int <= '0';
wait for t_per/2;

-- Generate test
d_int <= "111";
clk_int <= '1';
wait for t_per/8;
d_int <= "000";
wait for t_per/8;
d_int <= "111";
wait for t_per/8;
d_int <= "000";
wait for t_per/8;

clk_int <= '0';
wait for t_per/8;
d_int <= "111";
wait for t_per/8;
d_int <= "000";
wait for t_per/8;
d_int <= "111";
wait for t_per/8;
d_int <= "000";

clk_int <= '1';
wait for t_per/8;
d_int <= "111";
wait for t_per/8;
d_int <= "000";
wait for t_per/8;
d_int <= "111";
wait for t_per/8;

clk_int <= '0';
wait for t_per/8;
d_int <= "000";
wait;

wait for t_per;

end process;

end Behavioral;
