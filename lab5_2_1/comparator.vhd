library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- This unit compares the unsigned integer equivalent of v to 9;  If it is larger, z is 1, else, 0 
entity comparator is
    Port ( v : in STD_LOGIC_VECTOR (3 downto 0);
           z : out STD_LOGIC);
end comparator;

architecture Behavioral of comparator is

begin

main:process(v)
begin
    z <= '0';
    if (to_integer(unsigned(v)) > 9) then
        z <= '1';
    end if;

end process;

end Behavioral;
