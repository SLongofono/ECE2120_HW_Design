library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity AND_OR_gate_structural is
    port (a: in std_logic;
          b: in std_logic;
          c: in std_logic;
          d: out std_logic);
end and_or_gate_structural;

-- This intermediate entity builds the expression (a && b) | c from basic building blocks
architecture AND_OR_gate_struct of AND_OR_gate_structural is
component and2
port(
    i0, i1 : in STD_LOGIC;
    o : out STD_LOGIC);
end component;

component or2
port(
    i0, i1 : in STD_LOGIC;
    o : out STD_LOGIC);
end component;

Signal e : STD_LOGIC;

begin

-- This component will implement a && b
and_comp : and2
    port map (
        i0 => a,
        i1 => b,
        O => e); 

-- This component will implement c | (a && b), and output to the external facing port d
or_comp : or2
    port map (
        i0 => c,
        i1 => e,
        O => d);

end;