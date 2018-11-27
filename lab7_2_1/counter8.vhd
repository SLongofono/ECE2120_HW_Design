library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- This module models an 8-bit synchronous counter with asynchronous clear
-- The implementation is hierarchal using toggle latches.
entity counter8 is
    Port ( clk : in STD_LOGIC;
           en : in STD_LOGIC;
           clr : in STD_LOGIC;
           q : out STD_LOGIC_VECTOR (7 downto 0));
end counter8;

architecture Behavioral of counter8 is

component tflop is
    Port ( t : in STD_LOGIC;
       clk : in STD_LOGIC;
       clr : in STD_LOGIC;
       q : out STD_LOGIC);
end component;

signal q_bus: std_logic_vector(7 downto 0);
signal t_bus: std_logic_vector(7 downto 0);

begin

uut0: tflop
    port map(t => t_bus(0), clk => clk, clr => clr, q => q_bus(0));
uut1: tflop
    port map(t => t_bus(1), clk => clk, clr => clr, q => q_bus(1));
uut2: tflop
    port map(t => t_bus(2), clk => clk, clr => clr, q => q_bus(2));
uut3: tflop
    port map(t => t_bus(3), clk => clk, clr => clr, q => q_bus(3));
uut4: tflop
    port map(t => t_bus(4), clk => clk, clr => clr, q => q_bus(4));
uut5: tflop
    port map(t => t_bus(5), clk => clk, clr => clr, q => q_bus(5));
uut6: tflop
    port map(t => t_bus(6), clk => clk, clr => clr, q => q_bus(6));
uut7: tflop
    port map(t => t_bus(7), clk => clk, clr => clr, q => q_bus(7));

t_bus(0) <= en;
t_bus(1) <= en and q_bus(0);
t_bus(2) <= t_bus(1) and q_bus(1);
t_bus(3) <= t_bus(2) and q_bus(2);
t_bus(4) <= t_bus(3) and q_bus(3);
t_bus(5) <= t_bus(4) and q_bus(4);
t_bus(6) <= t_bus(5) and q_bus(5);
t_bus(7) <= t_bus(6) and q_bus(6);

q <= q_bus;

end Behavioral;
