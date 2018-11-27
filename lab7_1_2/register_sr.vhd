library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- This module models a synchronous register with asynchronous
-- reset, load, and set
entity register_sr is
    Port ( d : in STD_LOGIC_VECTOR (3 downto 0);
           q : out STD_LOGIC_VECTOR (3 downto 0);
           rst : in STD_LOGIC;
           load : in STD_LOGIC;
           setval : in STD_LOGIC_VECTOR (3 downto 0);
           clk : in STD_LOGIC);
end register_sr;

architecture Behavioral of register_sr is

signal q_s: std_logic_vector(3 downto 0);

begin

process(clk)
begin

if(rising_edge(clk)) then

    if('1' = rst) then
        q_s <= setval;
    elsif('1' = load) then
        q_s <= d;
    end if;

end if;

q <= q_s;

end process;


end Behavioral;
