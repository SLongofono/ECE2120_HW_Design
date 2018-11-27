library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- This module is a ripple-carry adder constructed of 2-bit full adders
entity CLA is
    Port ( p : in STD_LOGIC_VECTOR (3 downto 0);
           g : in STD_LOGIC_VECTOR (3 downto 0);
           cin: in STD_LOGIC;
           c : out STD_LOGIC_VECTOR (2 downto 0);
           cout: out STD_LOGIC
           );
end CLA;

architecture Behavioral of CLA is

begin

-- Generate carries as a group
c(0) <= g(0) or (p(0) and cin);
c(1) <= g(1) or (p(1) and (g(0) or (p(0) and cin)));
c(2) <= g(2) or (p(2) and (g(1) or (p(1) and (g(0) or (p(0) and cin)))));
cout <= g(3) or (p(3) and (g(2) or (p(2) and (g(1) or (p(1) and (g(0) or (p(0) and cin)))))));

end Behavioral;
