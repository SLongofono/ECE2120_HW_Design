library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2to1behav is
    Port ( x : in STD_LOGIC_VECTOR(1 DOWNTO 0);
           y : in STD_LOGIC_VECTOR(1 DOWNTO 0);
           s : in STD_LOGIC;
           m : out STD_LOGIC_VECTOR(1 DOWNTO 0));
end mux2to1behav;

-- Now, we use a behavioral style to illustrate the use of a process and sequential logic
architecture Behavioral of mux2to1behav is

begin

-- The process is sensitive to s, so it will execute as a unit every time an edge is detected
mySequential: process(x,y,s)
begin

if( s='0' ) then
    m <= y;
else
    m <= x;
end if;

end process;

end Behavioral;
