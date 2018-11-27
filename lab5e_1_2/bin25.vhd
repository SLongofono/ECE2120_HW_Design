library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- This module implements a simple 2 out of 5 binary encoder, taking as input
-- a 4-bit binary number and outputting the encoded form.  Note that 
entity bin25 is
    Port ( x : in STD_LOGIC_VECTOR (3 downto 0);
           y : out STD_LOGIC_VECTOR (4 downto 0));
end bin25;

architecture Behavioral of bin25 is

begin

y <= "00101" when x = "0001" else   --1
     "00110" when x = "0010" else   --2
     "01001" when x = "0011" else   --3
     "01010" when x = "0100" else   --4
     "01100" when x = "0101" else   --5
     "10001" when x = "0110" else   --6
     "10010" when x = "0111" else   --7
     "10100" when x = "1000" else   --8
     "11000" when x = "1001" else   --9
     "00011";                   -- Case 0 or others

end Behavioral;
