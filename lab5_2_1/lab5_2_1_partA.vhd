library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- This module is used to arrange the pieces of our dataflow design.  Here, we link together the multiple
-- smaller modules to implement the design shown in the schematic.  The desired behavior is that our circuit
-- will identify the 4-bit inputs which cannot be displayed on a single 7-segment unit, and change the input
-- to the mod-10 version of the input if so.
entity lab5_2_1_partA is
    Port ( v : in STD_LOGIC_VECTOR (3 downto 0);
           z : out STD_LOGIC;
           m : out STD_LOGIC_VECTOR (3 downto 0));
end lab5_2_1_partA;

architecture Behavioral of lab5_2_1_partA is


-- Component forward declaration
component mux2to1 is
    Port(   x : in STD_LOGIC;
            y : in STD_LOGIC;
            s : in STD_LOGIC;
            m : out STD_LOGIC);
end component;

component lab5_circuitA_dataflow is
    Port(   v : in STD_LOGIC_VECTOR (3 downto 0);
            m : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component comparator is
    Port(   v : in STD_LOGIC_VECTOR (3 downto 0);
            z : out STD_LOGIC);
end component;

-- Glue signals
-- Modified v output of circuitA
signal s_v: std_logic_vector(3 downto 0);

-- Z select for muxes
signal s_z: std_logic;

begin

m0Mux: mux2to1
    port map(   x => v(0),
                y => s_v(0),
                s => s_z,
                m => m(0)
    );

m1Mux: mux2to1
    port map(   x => v(1),
                y => s_v(1),
                s => s_z,
                m => m(1)
    );

m2Mux: mux2to1
    port map(   x => v(2),
                y => s_v(2),
                s => s_z,
                m => m(2)
    );

m3Mux: mux2to1
    port map(   x => v(3),
                y => '0',
                s => s_z,
                m => m(3)
    );

myComp: comparator
    port map(
        v => v,
        z => s_z
    );
    
myCircuitA: lab5_circuitA_dataflow
    port map(
        v => v,
        m => s_v
    );
    
-- Feed z upstream for top level
z <= s_z;

end Behavioral;
