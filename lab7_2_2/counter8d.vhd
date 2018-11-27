library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- This module models an 8-bit synchronous counter with asynchronous clear
-- The design is hierarchal, and adapts dlatches to be used as tlatches
entity counter8d is
    Port ( clk : in STD_LOGIC;
           clr : in STD_LOGIC;
           en : in STD_LOGIC;
           q : out STD_LOGIC_VECTOR (7 downto 0));
end counter8d;

architecture Behavioral of counter8d is

component dflop is
    Port ( d : in STD_LOGIC;
       clk : in STD_LOGIC;
       clr: in STD_LOGIC;
       q : out STD_LOGIC);
end component;

signal q_bus, t_bus, d_bus: std_logic_vector(7 downto 0);
signal clk_s: std_logic;

begin

d0: dflop port map(d => d_bus(0), clk => clk, clr => clr, q => q_bus(0));
d1: dflop port map(d => d_bus(1), clk => clk, clr => clr, q => q_bus(1));
d2: dflop port map(d => d_bus(2), clk => clk, clr => clr, q => q_bus(2));
d3: dflop port map(d => d_bus(3), clk => clk, clr => clr, q => q_bus(3));
d4: dflop port map(d => d_bus(4), clk => clk, clr => clr, q => q_bus(4));
d5: dflop port map(d => d_bus(5), clk => clk, clr => clr, q => q_bus(5));
d6: dflop port map(d => d_bus(6), clk => clk, clr => clr, q => q_bus(6));
d7: dflop port map(d => d_bus(7), clk => clk, clr => clr, q => q_bus(7));

d_bus <= t_bus xor q_bus;

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
