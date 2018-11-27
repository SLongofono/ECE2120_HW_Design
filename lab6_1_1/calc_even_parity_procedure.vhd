library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--use IEEE.NUMERIC_STD.ALL;

-- This module wraps a procedure to calculate parity on an input byte.
entity calc_even_parity_procedure is
    Port ( ain : in STD_LOGIC_VECTOR (7 downto 0);
           parity : out STD_LOGIC);
end calc_even_parity_procedure;

architecture Behavioral of calc_even_parity_procedure is

procedure calc_even(
    signal inp: in STD_LOGIC_VECTOR(7 downto 0);
    signal p: out STD_LOGIC
) is

variable toggle: STD_LOGIC;
begin
    toggle := '1';
    FOR X in ain'range LOOP
        if('1' = inp(X)) then
            toggle := not toggle;
        end if;
    END LOOP;
    
    p <= toggle;
    
end calc_even;

begin

calc_even(ain, parity);

end Behavioral;
