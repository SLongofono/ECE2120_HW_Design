library ieee;
use ieee.std_logic_1164.all;

entity and_gate_struct is
    port (a: in std_logic;
    b: in std_logic; 
    c: in std_logic;
    d: out std_logic);
end and_gate_struct;

-- This intermediate entity builds the expression (a && b && c) from basic building blocks
architecture structural of and_gate_struct is

component and2
    port(
        i0, i1 : in STD_LOGIC;
        O : out STD_LOGIC
    );
end component;

Signal a_int : STD_LOGIC;

begin

and_comp_1: and2
    port map (
        i0 => a,
        i1 => b,
        o => a_int
);
    
and_comp_2 : and2
    port map (
        i0 => a_int,
        i1=> c,
        o => d
);

end structural; 