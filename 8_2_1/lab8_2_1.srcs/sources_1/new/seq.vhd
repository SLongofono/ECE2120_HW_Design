library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- This module models a sequence detector as a mealy FSM
-- There are three sequences of interest:
-- 1) 01, 00 outputs '0';
-- 2) 11, 00 outputs '1';
-- 3) 10, 00 outputs the opposite of the current value
entity seq is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           ain : in STD_LOGIC_VECTOR (1 downto 0);
           yout : out STD_LOGIC);
end seq;

architecture Behavioral of seq is

type state is (s_rst, s_01, s_10, s_11, s_0100, s_1000, s_1100);
signal curr_state : state := s_rst;
signal next_state: state;
signal output: std_logic := '0';

begin

advance_state: process(clk, rst)
begin
if('1' = rst) then
    curr_state <= s_rst;
elsif(rising_edge(clk)) then
    curr_state <= next_state;
end if;
end process;

op_logic: process(curr_state)
begin
    case curr_state is
        when s_0100 =>  -- op 0
            output <= '0';
        when s_1100 =>  -- op 1
            output <= '1';
        when s_1000 =>  -- op toggle
            output <= not output;
        when others =>  -- no change
            output <= output;
    end case;
end process;

state_logic: process(curr_state, ain)
begin

next_state <= curr_state;

case curr_state is
    when s_rst =>      -- start state
        if ("01" = ain) then
            next_state <= s_01;
        elsif("10" = ain) then
            next_state <= s_10;
        elsif("11" = ain) then
            next_state <= s_11;
        end if;
    when s_01 =>      -- got 01 state
        if("00" = ain) then
            next_state <= s_0100;
        elsif("11" = ain) then
            next_state <= s_11;
        elsif("10" = ain) then
            next_state <= s_10;
        end if;
    when s_10 =>      -- got 10 state
        if("00" = ain) then
            next_state <= s_1000;
        elsif("11" = ain) then
            next_state <= s_11;
        elsif("01" = ain) then
            next_state <= s_01;
        end if;
    when s_11 =>      -- got 11 state
        if("00" = ain) then
            next_state <= s_1100;
        elsif("01" = ain) then
            next_state <= s_01;
        elsif("10" = ain) then
            next_state <= s_10;
        end if;
    when s_0100 =>      -- got 0100 state
        if("10" = ain) then
            next_state <= s_10;
        elsif("11" = ain) then
            next_state <= s_11;
        elsif("01" = ain) then
            next_state <= s_01;
        end if;
    when s_1000 =>  -- got toggle state
        if("01" = ain) then
            next_state <= s_01;
        elsif("11" = ain) then
            next_state <= s_11;
        elsif("10" = ain) then
            next_state <= s_10;
        else
            next_state <= s_rst;
        end if;
    when others =>  -- s_1100, got 1100 state
        if("01" = ain) then
            next_state <= s_01;
        elsif("11" = ain) then
            next_state <= s_11;
        elsif("10" = ain) then
            next_state <= s_10;
        end if;

end case;

end process;

yout <= output;

end Behavioral;