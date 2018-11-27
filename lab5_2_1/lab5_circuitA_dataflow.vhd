library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- This unit adjusts the input v to the mod 10 version, for use in our top-level design
entity lab5_circuitA_dataflow is
    Port ( v : in STD_LOGIC_VECTOR (3 downto 0);
           m : out STD_LOGIC_VECTOR (3 downto 0));
end lab5_circuitA_dataflow;

architecture Behavioral of lab5_circuitA_dataflow is

begin

main:process(v)
variable decVal:natural;
begin
    decVal := to_integer(unsigned(v));
    m <= v;
    -- If the decimal equivalent is greater than 10, subtract ten
    if( decVal > 9) then
        m <= std_logic_vector( to_unsigned((decVal - 10), 4));
    end if;

end process;

end Behavioral;
