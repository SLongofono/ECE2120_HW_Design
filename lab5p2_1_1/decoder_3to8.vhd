library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- This module implements a 3-to-8 decoder in the style of the 74SL138
-- The enable for the top-level is active-high, and the enables for the
-- sub-levels are active low.  Per the datasheet, two 2-to-4 decoders are
-- configured in cascade to realize the design
entity decoder_3to8 is
    Port ( en : in STD_LOGIC_VECTOR (2 downto 0);
           x : in STD_LOGIC_VECTOR (2 downto 0);
           y : out STD_LOGIC_VECTOR (7 downto 0));
end decoder_3to8;

architecture Behavioral of decoder_3to8 is

-- Component forward declarations
component decoder_2to4 is
    Port(   en : in STD_LOGIC;
            x : in STD_LOGIC_VECTOR (1 downto 0);
            y : out STD_LOGIC_VECTOR (3 downto 0));
end component;

-- Glue signals
signal op0: std_logic_vector(3 downto 0);
signal op1: std_logic_vector(3 downto 0);

begin

dec0: decoder_2to4
    port map(
        en => en(0),
        x => x(1 downto 0),
        y => op0
    );

dec1: decoder_2to4
        port map(
            en => en(1),
            x => x(1 downto 0),
            y => op1
        );

-- Lower half uses 2to4 decoder 0
y(0) <= '1' when en(2) = '0' or x(2) = '1' else
        op0(0);
y(1) <= '1' when en(2) = '0' or x(2) = '1' else
        op0(1);
y(2) <= '1' when en(2) = '0' or x(2) = '1' else
        op0(2);
y(3) <= '1' when en(2) = '0' or x(2) = '1' else
        op0(3);

-- Upper half uses 2to4 decoder 1
y(4) <= '1' when en(2) = '0' or x(2) = '0' else
        op1(0);
y(5) <= '1' when en(2) = '0' or x(2) = '0' else
        op1(1);
y(6) <= '1' when en(2) = '0' or x(2) = '0' else
        op1(2);
y(7) <= '1' when en(2) = '0' or x(2) = '0' else
        op1(3);
        
end Behavioral;
