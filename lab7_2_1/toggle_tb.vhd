----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/19/2018 03:12:12 PM
-- Design Name: 
-- Module Name: toggle_tb - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity toggle_tb is
--  Port ( );
end toggle_tb;

architecture Behavioral of toggle_tb is

component tflop is
    Port ( t : in STD_LOGIC;
           clk : in STD_LOGIC;
           clr : in STD_LOGIC;
           q : out STD_LOGIC);
end component;

signal t_int, clk_int, clr_int, q_int: std_logic;

begin

uut: tflop
    port map(
        t => t_int,
        clk => clk_int,
        clr => clr_int,
        q => q_int
    );

process
begin
clk_int <= '0';
clr_int <= '0';
t_int <= '0';

wait for 10 ns;
clr_int <= '1';

wait for 10 ns;

clk_int <= '1';
wait for 10 ns;
clk_int <= '0';
wait for 10 ns;
t_int <= '1';
clk_int <= '1';
wait for 10 ns;
clk_int <= '0';
wait for 10 ns;
clk_int <= '1';
wait for 10 ns;
clk_int <= '0';
wait for 10 ns;
clk_int <= '1';
wait for 10 ns;
clk_int <= '0';
wait for 2 ns;
clr_int <= '0';
wait for 2 ns;
clr_int <= '1';
wait for 6 ns;
clk_int <= '1';
wait for 10 ns;
clk_int <= '0';
wait;

end process;

end Behavioral;
