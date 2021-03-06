library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;

-- This module demonstrates the use of a function to return a value.
-- This behavior is similar to that of a procedure, except that it is in a sense pure and
-- does not permit any waiting.
entity calc_ones_function is
  Port ( 
    ain: in std_logic_vector(7 downto 0);
    number_of_ones: out std_logic_vector(2 downto 0)
  );
end calc_ones_function;

architecture Behavioral of calc_ones_function is

-- Note: for some awful reason, providing a bound for the size of the return is
-- ignored, and therefore marked as a syntax error if included.  The rationale is that the 
-- type and size checking is done downstream at assignment, and the function doesn't care.  Hooray.
function do_work(   ain: std_logic_vector(7 downto 0)
    ) return std_logic_vector is
    variable n: integer := 0;
begin
    for X in ain'range loop
        if('1' = ain(X)) then
            n := n + 1;
        end if;
    end loop;
    return std_logic_vector(to_unsigned(n, 3));
end do_work;

begin

number_of_ones <= do_work(ain);

end Behavioral;
