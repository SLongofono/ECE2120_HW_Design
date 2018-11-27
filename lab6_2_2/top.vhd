library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- This top level module is used to demonstrate the behavior of a level sensitive dlatch alongside 
-- synchronous dlatches that react on the rising and falling edge of the clock.
entity top is
    Port ( d : in STD_LOGIC_VECTOR (2 downto 0);
           clk : in STD_LOGIC;
           q : out STD_LOGIC_VECTOR (2 downto 0);
           qbar : out STD_LOGIC_VECTOR (2 downto 0));
end top;

architecture Behavioral of top is

signal d_s: std_logic_vector(2 downto 0);
signal q_s: std_logic_vector(2 downto 0);
signal qbar_s: std_logic_vector(2 downto 0);
signal clk_n: std_logic;

component dlatch is
    Port ( d : in STD_LOGIC;
       clk : in STD_LOGIC;
       q : out STD_LOGIC;
       qbar : out STD_LOGIC);
end component;

component dlatch_sync is
    Port ( d : in STD_LOGIC;
       clk : in STD_LOGIC;
       q : out STD_LOGIC;
       qbar : out STD_LOGIC);
end component;

begin

ls_latch: dlatch
    port map(
        d => d_s(0),
        q => q_s(0),
        qbar => qbar_s(0),
        clk => clk
    );

rising_latch: dlatch_sync
    port map(
        d => d_s(1),
        q => q_s(1),
        qbar => qbar_s(1),
        clk => clk
    );

falling_latch: dlatch_sync
        port map(
            d => d_s(2),
            q => q_s(2),
            qbar => qbar_s(2),
            clk => clk_n
        );

clk_n <= not clk;
d_s <= d;
q <= q_s;
qbar <= qbar_s;


end Behavioral;
