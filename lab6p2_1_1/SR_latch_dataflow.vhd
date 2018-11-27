library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- This module implements a simple SR latch
entity SR_latch_dataflow is
    Port ( S : in STD_LOGIC;
           R : in STD_LOGIC;
           Q : out STD_LOGIC;
           Qbar : out STD_LOGIC);
end SR_latch_dataflow;

architecture Behavioral of SR_latch_dataflow is

signal s_Q, s_Qbar: std_logic;

begin

Q <= s_Q;
Qbar <= s_Qbar;

s_Q <= s_Qbar nor R after 2 ns;
s_Qbar <= s_Q nor S after 2 ns;

end Behavioral;
