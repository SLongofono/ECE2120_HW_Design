library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- This module is an 8-to-3 priority encoder, with some additional 
-- auxiliary information bits (enabled and good state)
-- Note that I used a catchall with the same outputs as the enabled/bad state case
entity enc38 is
    Port ( v : in STD_LOGIC_VECTOR (7 downto 0);
           en_in_n : in STD_LOGIC;
           en_out : out STD_LOGIC;
           gs : out STD_LOGIC;
           y : out STD_LOGIC_VECTOR (2 downto 0));
end enc38;

architecture Behavioral of enc38 is

begin

main: process
begin
    -- Use an if-else block to enforce priority
    if en_in_n = '1' then
        y <= "111";
        gs <= '1';
        en_out <= '1';
    elsif v = "1111111" then
        y <= "111";
        gs <= '1';
        en_out <= '0';
    elsif v(7) = '0' then
        y <= "000";
        gs <= '0';
        en_out <= '1';
    elsif v(6) = '0' then
        y <= "001";
        gs <= '0';
        en_out <= '1';
    elsif v(5) = '0' then
        y <= "010";
        gs <= '0';
        en_out <= '1';
    elsif v(4) = '0' then
        y <= "011";
        gs <= '0';
        en_out <= '1';
    elsif v(3) = '0' then
        y <= "100";
        gs <= '0';
        en_out <= '1';
    elsif v(2) = '0' then
        y <= "101";
        gs <= '0';
        en_out <= '1';
    elsif v(1) = '0' then
        y <= "110";
        gs <= '0';
        en_out <= '1';
    elsif v(0) = '0' then
        y <= "111";
        gs <= '0';
        en_out <= '1';
    else
        -- Illegal state
        y <= "111";
        gs <= '1';
        en_out <= '1';
    end if;
                
end process;

end Behavioral;
