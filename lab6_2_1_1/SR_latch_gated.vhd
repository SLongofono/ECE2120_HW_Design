----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/11/2018 07:46:24 PM
-- Design Name: 
-- Module Name: SR_latch_gated - Behavioral
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

-- This module implements a gated SR latch which should have more stable output due to the enable.
-- This is provided our use of enable is stable.
entity SR_latch_gated is
    Port ( S : in STD_LOGIC;
           R : in STD_LOGIC;
           E : in STD_LOGIC;
           Q : out STD_LOGIC;
           Qbar : out STD_LOGIC);
end SR_latch_gated;

architecture Behavioral of SR_latch_gated is

signal s_q, s_qbar: std_logic;

begin

s_q <= s_qbar nor (R and E) after 2 ns;
s_qbar <= s_q nor (S and E) after 2 ns;

Q <= s_q;
Qbar <= s_qbar;

end Behavioral;
