----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/27/2018 07:31:01 PM
-- Design Name: 
-- Module Name: mux2to1struct - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity mux2to1struct is
    Port ( x : in STD_LOGIC_VECTOR (1 downto 0);
           y : in STD_LOGIC_VECTOR (1 downto 0);
           s : in STD_LOGIC;
           m : out STD_LOGIC_VECTOR (1 downto 0));
end mux2to1struct;

architecture Behavioral of mux2to1struct is

component and_or_gate_structural is
    port (a: in std_logic;
      b: in std_logic;
      c: in std_logic;
      d: out std_logic);
 end component;

component and2 is
    Port ( i0 : in STD_LOGIC;
       i1 : in STD_LOGIC;
       O : out STD_LOGIC);
end component;

component not1 is
    Port ( i : in STD_LOGIC;
       o : out STD_LOGIC);
end component;

-- Intermediate signals connect our building blocks
signal s_not: std_logic;    -- Inverted s
signal xAndOP0: std_logic;  -- Output of x(0) AND s'
signal xANDOP1: std_logic;  -- Output of x(1) AND s'
signal m_latch: std_logic_vector(1 downto 0);

begin

-- Now, we build in a structural style.  Each component handles some portion of our computation.
-- By stringing them together, we realize the same function without including any explicit logic.
-- This style mimics what we would see in a schematic.

-- The expression (x and s') | (y and s) needs to be built from the smaller building blocks
-- In this case, we use and2 along with the and_or gate building block to form the original expression.
-- We also need the inverter block for the input s.
-- We also need a signal to catch the output, so we can apply a delay before propagating the result

inverter: not1
    port map(i => s, o => s_not);
    
andGateX0: and2
    port map(i0 => s_not, i1 => x(0), o => xANDOP0);

andGateX1: and2
        port map(i0 => s_not, i1 => x(1), o => xANDOP1);
    
weirdgate0: and_or_gate_structural
    port map(a => y(0), b => s, c => xANDOP0, d => m_latch(0) );

weirdgate1: and_or_gate_structural
    port map(a => y(1), b => s, c => xANDOP1, d => m_latch(1) );

-- Now that all connections are made, we connect the final output with a delay
m <= m_latch after 3 ns;


end Behavioral;
