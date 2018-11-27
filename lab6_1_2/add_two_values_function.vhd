library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;

-- This module demonstrates the use of a function to return a value.
-- This behavior is similar to that of a procedure, except that it is in a sense pure and
-- does not permit any waiting.
entity add_two_values_function is
  Port ( 
    ain, bin: in std_logic_vector(3 downto 0);
    sum: out std_logic_vector(4 downto 0)
  );
end add_two_values_function;

architecture Behavioral of add_two_values_function is

-- Note: for some awful reason, providing a bound for the size of the return is
-- ignored, and therefore marked as a syntax error if included.  The rationale is that the 
-- type and size checking is done downstream at assignment, and the function doesn't care.  Hooray.
function do_work(   a, b: std_logic_vector(3 downto 0)
    ) return std_logic_vector is
begin
    return std_logic_vector(to_unsigned((to_integer(unsigned(a)) + to_integer(unsigned(b))), 5));
end do_work;

begin

sum <= do_work(ain, bin);
end Behavioral;
