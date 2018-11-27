library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bcdto7segment_dataflow is
    Port ( x : in STD_LOGIC_VECTOR (3 downto 0);
           an : out STD_LOGIC_VECTOR (7 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0));
end bcdto7segment_dataflow;

-- This design drives a single 7-segment display in a behavioral style.
-- Per the tutorial, we have to toggle the anode of the desired active display to '0',
-- and then drive the individual segments based on the number intended to be displayed.
architecture Behavioral of bcdto7segment_dataflow is

begin

makeNumbers: process(x)
begin
    -- The case statement makes it easy to identify what each input means and define behavior accodingly
    -- Here, we use the 4-bit input to drive outputs to display the decimal equivalent
    -- Note that we use negative logic here, to create a potential across the LEDS
    
    case x is
        when "0001" =>          -- 1
            seg <= "1111001";
        when "0010" =>          -- 2
            seg <= "0100100";
        when "0011" =>          -- 3
            seg <= "0110000";
        when "0100" =>          -- 4
            seg <= "0011001";
        when "0101" =>          -- 5
            seg <= "0010010";
        when "0110" =>          -- 6
            seg <= "0000010";
        when "0111" =>          -- 7
            seg <= "1111000";
        when "1000" =>          -- 8
            seg <= "0000000";
        when "1001" =>          -- 9
            seg <= "0010000";
        when others =>          -- 0
            seg <= "1000000";
    end case;
                
end process;

-- Only drive the anode of the desired display high/on
an <= "11111110";

end Behavioral;
