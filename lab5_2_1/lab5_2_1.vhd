library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- This file will make use of the modified switch input and the BCD 7-segment display driver
-- from the previous lab to implement our design.  This is a mixed dataflow and behavioral flow.
entity lab5_2_1 is
    Port ( v : in STD_LOGIC_VECTOR (3 downto 0);
           z: out STD_LOGIC;
           an : out STD_LOGIC_VECTOR (7 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0));
end lab5_2_1;

architecture Behavioral of lab5_2_1 is

-- Component forward declarations
component lab5_2_1_partA is
    Port(   v : in STD_LOGIC_VECTOR (3 downto 0);
            z : out STD_LOGIC;
            m : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component bcdto7segment_dataflow is
    Port(   x : in STD_LOGIC_VECTOR (3 downto 0);
            an : out STD_LOGIC_VECTOR (7 downto 0);
            seg : out STD_LOGIC_VECTOR (6 downto 0));
end component;


-- Glue signals
signal s_data: std_logic_vector(3 downto 0);

begin

myFilter: lab5_2_1_partA
    port map(   v => v,
                z => z,
                m => s_data
    );

my7Seg: bcdto7segment_dataflow
    port map(   x => s_data,
                an => an,
                seg => seg
    );

end Behavioral;
