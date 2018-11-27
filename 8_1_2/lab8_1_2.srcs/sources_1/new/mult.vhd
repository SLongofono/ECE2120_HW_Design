library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- This module models a 3-bit unsigned multiplier as realized from an ASM design
-- The ASM states correspond to the internal FSM, and we use a register approach to accumulate
-- the result
entity mult is
    Port ( clk : in STD_LOGIC;
           start : in STD_LOGIC;
           done : out STD_LOGIC;
           multiplicand : in STD_LOGIC_VECTOR (2 downto 0);
           multiplier : in STD_LOGIC_VECTOR (2 downto 0);
           product : out STD_LOGIC_VECTOR (5 downto 0));
end mult;

architecture Behavioral of mult is

type state is (s0,s1,s2,s3);

signal curr_state: state;
signal r_count: std_logic_vector(2 downto 0);
signal r_output : std_logic_vector(5 downto 0);
signal output: std_logic_vector(5 downto 0);


begin


-- Modified Mealy machine matches the ASM
state_logic: process(curr_state, start, clk)
variable cnt: std_logic_vector(2 downto 0);

begin
    if(rising_edge(clk)) then
        if('1' = start) then    -- rubric indicates start is a synchronous reset...
            done <= '0';
            r_output <= "000000";
            r_count <= "000";
            curr_state <= s1;          
        else
            case curr_state is
                when s1 =>      -- Check 0 state
                    if("000" = multiplicand) or ("000" = multiplier) then
                        curr_state <= s3;
                    else
                        curr_state <= s2;
                    end if;
                
                when s2 =>      -- Accumulate state
                    r_output <= std_logic_vector(unsigned(r_output) + unsigned(multiplicand));
                    
                    cnt := r_count;
                    cnt := std_logic_vector(unsigned(cnt) + 1);        
                    if(multiplier = "001") or (multiplier = cnt) then
                        curr_state <= s3;
                    end if;
                    
                    r_count <= cnt;
        
                when s3 =>      -- Update output state
                    done <= '1';
                    output <= r_output;
                    curr_state <= s0;
                
                when others =>  -- Start state
                    done <= '0';
                    r_output <= "000000";
                    r_count <= "000";
                    curr_state <= s0;
            end case;
        end if; -- start signal
    end if; -- rising edge
end process;

-- This approach allows the output to remain stable, outside modules need not see how the output buffer is updated with intermediate results
product <= output;

end Behavioral;
