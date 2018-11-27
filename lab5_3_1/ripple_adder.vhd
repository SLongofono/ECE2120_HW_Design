library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- This module is a ripple-carry adder constructed of 2-bit full adders
entity ripple_adder is
    Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           cin : in STD_LOGIC;
           cout : out STD_LOGIC;
           an: out std_logic_vector(7 downto 0);
           seg: out std_logic_vector(6 downto 0)
           );
end ripple_adder;

architecture Behavioral of ripple_adder is

--Component forward declarations
component bcdto7segment_dataflow is
      Port(     x : in STD_LOGIC_VECTOR (3 downto 0);
                an : out STD_LOGIC_VECTOR (7 downto 0);
                seg : out STD_LOGIC_VECTOR (6 downto 0));
end component;

component CLA is
    Port ( p : in STD_LOGIC_VECTOR (3 downto 0);
       g : in STD_LOGIC_VECTOR (3 downto 0);
       cin: in STD_LOGIC;
       c : out STD_LOGIC_VECTOR (2 downto 0);
       cout: out STD_LOGIC
       );
end component;

component fulladder_dataflow is
    Port ( a : in STD_LOGIC;
       b : in STD_LOGIC;
       cin : in STD_LOGIC;
       s : out STD_LOGIC;
       p : out STD_LOGIC;
       g : out STD_LOGIC);
end component;

-- Glue signals
signal result: std_logic_vector(3 downto 0);
signal carryOut: std_logic;
signal carries: std_logic_vector(2 downto 0);
signal pvals: std_logic_vector(3 downto 0);
signal gvals: std_logic_vector(3 downto 0);

begin

my7seg: bcdto7segment_dataflow
    port map(
        x => result,
        an => an,
        seg => seg
    );

add0: fulladder_dataflow
    port map(
        a => a(0),
        b => b(0),
        cin => cin,
        s => result(0),
        p => pvals(0),
        g => gvals(0)
    );
add1: fulladder_dataflow
    port map(
        a => a(1),
        b => b(1),
        cin => carries(0),
        s => result(1),
        p => pvals(1),
        g => gvals(1)
    );
add2: fulladder_dataflow
    port map(
        a => a(2),
        b => b(2),
        cin => carries(1),
        s => result(2),
        p => pvals(2),
        g => gvals(2)
    );
add3: fulladder_dataflow
    port map(
        a => a(3),
        b => b(3),
        cin => carries(2),
        s => result(3),
        p => pvals(3),
        g => gvals(3)
    );

myCLA: CLA
    port map(
        p => pvals,
        g => gvals,
        cin => cin,
        c => carries,
        cout => cout
    );

end Behavioral;
