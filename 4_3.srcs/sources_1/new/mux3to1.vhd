library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux3to1 is
    Port ( u : in STD_LOGIC_VECTOR (1 downto 0);
           v : in STD_LOGIC_VECTOR (1 downto 0);
           w : in STD_LOGIC_VECTOR (1 downto 0);
           s0 : in STD_LOGIC;
           s1 : in STD_LOGIC;
           m : out STD_LOGIC_VECTOR (1 downto 0));
end mux3to1;

-- Here, we build a 3to1 mux using two 2to1 muxes.  This constitutes a mixed style,
-- wherein we use a mix of behavioral and structural design.
architecture Behavioral of mux3to1 is

-- We will use the two input mux in a cascade configuration
component mux2to1behav is
   Port ( x : in STD_LOGIC_VECTOR(1 DOWNTO 0);
        y : in STD_LOGIC_VECTOR(1 DOWNTO 0);
        s : in STD_LOGIC;
        m : out STD_LOGIC_VECTOR(1 DOWNTO 0));
end component;

signal mux1OP: STD_LOGIC_VECTOR(1 downto 0); -- Output data of first mux

begin

mux1: mux2to1behav
    port map(x => u, y => v, s => s0, m => mux1OP);

mux2: mux2to1behav
    port map(x => mux1OP, y => w, s => s1, m => m );


end Behavioral;
