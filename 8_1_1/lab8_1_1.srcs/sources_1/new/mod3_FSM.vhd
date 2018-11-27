library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- This module models a modulus 3 detector (output 1 if the number of 1's seen is divisble by 3)
entity mod3_FSM is
    Port ( ain : in STD_LOGIC;
           yout : out STD_LOGIC;
           clk : in STD_LOGIC;
           c: out std_logic_vector(3 downto 0);
           reset : in STD_LOGIC);
end mod3_FSM;

architecture Behavioral of mod3_FSM is

type state is (start, seen1, seen2);
signal curr_state: state := start;
signal count: natural := 0;

begin

main:process(curr_state, ain, reset, clk)
begin
    
    if('1' = reset) then
        yout <= '0';
        curr_state <= start;
    elsif(rising_edge(clk)) then
    
        yout <= '0';

        case curr_state is
            when seen2 =>
                if ('1' = ain) then
                    curr_state <= start;
                    yout <= '1';
                    count <= count + 1;
                else
                    curr_state <= curr_state;
                end if;
            when seen1 =>
                if('1' = ain) then
                    curr_state <= seen2;
                end if;
            when others =>
                if('1' = ain) then
                    curr_state <= seen1;
                end if;
        end case;
        
    end if;
end process;

c <= std_logic_vector(to_unsigned(count, 4));

end Behavioral;
