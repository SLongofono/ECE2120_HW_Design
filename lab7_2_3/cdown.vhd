library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

--This module models a synchronous down-counter with load
--functionality and a synchronous clear
entity cdown is
    Port ( clk : in STD_LOGIC;
           clear : in STD_LOGIC;
           load : in STD_LOGIC;
           enable : in STD_LOGIC;
           q : out STD_LOGIC_VECTOR (3 downto 0));
end cdown;

architecture Behavioral of cdown is

signal count: std_logic_vector(3 downto 0) := "0000";
signal cnt_done: std_logic;


begin

process(clk)
begin

if(rising_edge(clk)) then

    if('1' = clear) then
        count <= "0000";
    elsif ('1' = enable) then
        if('1' = (load or cnt_done)) then
            count <= "1010";
        else
            count <= count - '1'; --std_logic_vector(unsigned(count) - 1);
        end if;
    end if;
end if;

end process;

cnt_done <= not(count(3) or count(2) or count(1) or count(0));
q <= count;

end Behavioral;
