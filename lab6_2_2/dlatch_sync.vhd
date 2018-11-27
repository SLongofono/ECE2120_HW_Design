----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/15/2018 11:31:22 AM
-- Design Name: 
-- Module Name: dlatch_sync - Behavioral
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

-- This module models a synchronous dlatch
entity dlatch_sync is
    Port ( d : in STD_LOGIC;
       clk : in STD_LOGIC;
       q : out STD_LOGIC;
       qbar : out STD_LOGIC);
end dlatch_sync;

architecture Behavioral of dlatch_sync is

begin

main:process(clk, d)
begin

if(rising_edge(clk)) then
    q <= d;
    qbar <= not d;
end if;

end process;


end Behavioral;
