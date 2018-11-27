library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- This module models a register with a synchronous reset and a load signal
entity register_synch_load is
    Port ( d : in STD_LOGIC_VECTOR (3 downto 0);
           q : out STD_LOGIC_VECTOR (3 downto 0);
           load : in STD_LOGIC;
           clk : in STD_LOGIC;
           rst : in STD_LOGIC);
end register_synch_load;

architecture Behavioral of register_synch_load is

signal d_s, q_s: std_logic_vector(3 downto 0);

begin

main:process(clk)
begin

if(rising_edge(clk)) then
    if('1' = rst) then
        q_s <= "0000";
    elsif ('1' = load) then
        q_s <= d_s;
    end if;
end if;

end process;
d_s <= d;
q <= q_s;

end Behavioral;
