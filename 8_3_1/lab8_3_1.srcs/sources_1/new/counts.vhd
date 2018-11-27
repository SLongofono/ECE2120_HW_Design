library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- This module models a specific count counter as a mealy machine,
-- using a ROM to capture the sequential states and their output.
-- Here, our states are uniquely represented by our outputs, so we
-- only need to store the output bits
entity counts is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           led : out STD_LOGIC_VECTOR (2 downto 0));
end counts;

architecture Behavioral of counts is

type ROM is array(0 to 5) of std_logic_vector(2 downto 0);
subtype SHORT is integer range 0 to 5;

constant stateROM: ROM :=
(
    "000",
    "001",
    "011",
    "101",
    "111",
    "010"
);

signal curState: SHORT;

begin

advance_state: process(clk)
begin
    if('1' = rst) then
        curState <= 0;
    elsif(rising_edge(clk)) then
        if(5 = curState) then
            curState <= 0;
        else
            curState <= curState + 1;
        end if;
    end if;
end process;

-- In this case, the only input is the clock, so our state logic is coupled with our output logic
-- The clock triggers process 1, which updates the current state, so the output is a function of both the
-- clock input and the current state

led <= stateROM(curState);


end Behavioral;
