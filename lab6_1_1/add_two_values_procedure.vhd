library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


-- This module wraps a procedure to demonstrate their use
entity add_two_values_procedure is
    Port ( ain : in STD_LOGIC_VECTOR (3 downto 0);
           bin : in STD_LOGIC_VECTOR (3 downto 0);
           cout : out STD_LOGIC;
           sum : out STD_LOGIC_VECTOR (3 downto 0));
end add_two_values_procedure;


architecture Behavioral of add_two_values_procedure is

-- Procedures are convenience constructs used to complete common tasks.
-- We declare them in an architecture or in a separate file for import via the use.<lib>.<func>
-- syntax
procedure add_two_values_procedure1 (
    signal a,b: in std_logic_vector(3 downto 0);
    signal cout: out std_logic;
    signal dout: out std_logic_vector(3 downto 0)
    ) is
    variable rawSum: integer;

begin
    rawSum := to_integer(unsigned(a)) + to_integer(unsigned(b));
    if(rawSum > 15) then
        cout <= '1';
        dout <= std_logic_vector(to_unsigned((rawSum mod 15), 4));        
    else
        cout <= '0';
        dout <= std_logic_vector(to_unsigned(rawSum, 4));
    end if;
end add_two_values_procedure1;

begin

add_two_values_procedure1(ain,bin,cout,sum);

end Behavioral;
