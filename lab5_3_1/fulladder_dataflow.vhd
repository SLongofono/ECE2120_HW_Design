----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/04/2018 07:00:20 PM
-- Design Name: 
-- Module Name: fulladder_dataflow - Behavioral
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

-- This module is a simple two bit adder circuit
entity fulladder_dataflow is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           cin : in STD_LOGIC;
           s : out STD_LOGIC;
           p : out STD_LOGIC;
           g : out STD_LOGIC);
end fulladder_dataflow;

architecture Behavioral of fulladder_dataflow is

begin

s <= a xor b xor cin;
p <= a or b;
g <= a and b;

end Behavioral;
