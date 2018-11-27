----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/15/2018 01:41:40 PM
-- Design Name: 
-- Module Name: tlatch - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- This module models a toggle latch with clock enable and synchronous, negative logic reset
entity tlatch is
    Port ( t : in STD_LOGIC;
           rst : in STD_LOGIC;
           ce : in STD_LOGIC;
           clk : in STD_LOGIC;
           q : out STD_LOGIC);
end tlatch;

architecture Behavioral of tlatch is

-- We explicitly create a latch via the signal q_last
signal q_last: std_logic;

begin

process(clk)
begin

if(rising_edge(clk)) then
    if('0' = rst) then
        q_last <= '0';
    elsif('1' = ce) and ('1' = t) then
        q_last <= not q_last;
        
    end if;
end if;

q <= q_last;

end process;

end Behavioral;
