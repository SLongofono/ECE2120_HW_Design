----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/15/2018 11:27:17 AM
-- Design Name: 
-- Module Name: dlatch - Behavioral
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

-- This module models a level-sensitive dlatch
entity dlatch is
    Port ( d : in STD_LOGIC;
           clk : in STD_LOGIC;
           q : out STD_LOGIC;
           qbar : out STD_LOGIC);
end dlatch;

architecture Behavioral of dlatch is

begin
main: process(clk, d)
begin
    if('1' = clk) then
        q <= d;
        qbar <= not d;
    end if;
end process;

end Behavioral;
