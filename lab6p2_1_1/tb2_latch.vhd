--------------------------------------------
-- Module Name: SR_latch_dataflow_tb
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use std.textio.all;
use IEEE.std_logic_textio.all;

library UNISIM;
use UNISIM.VComponents.all;

Entity tb2_latch Is
end tb2_latch;

Architecture behavior of tb2_latch Is
	Component SR_latch_dataflow Is
port (
		R : in STD_LOGIC;
		S : in STD_LOGIC;
		Q     : out STD_LOGIC;
		Qbar : out STD_LOGIC
	);
end component;

	Signal r_int : STD_LOGIC := '0';
	Signal s_int : STD_LOGIC := '0';
	Signal q_int : STD_LOGIC := '0';
	Signal q_bar_int : STD_LOGIC := '0';
	
begin
	uut:  SR_latch_dataflow PORT MAP (
			R => r_int,
			S => s_int,
			Q => q_int,
			Qbar => q_bar_int
		 );
		 
	process

	begin
		s_int <= '0'; r_int <= '0';
		
	    wait for 10 ns; s_int <= '1';
	    wait for 10 ns; s_int <= '0';
	    wait for 10 ns; r_int <= '1';
	    wait for 10 ns; s_int <= '1'; r_int <= '0';
	    wait for 10 ns; s_int <= '0'; r_int <= '1';
	    wait for 10 ns; s_int <= '1'; r_int <= '0';
	    wait for 10 ns; s_int <= '0'; r_int <= '1';
	    wait for 10 ns; s_int <= '1'; r_int <= '1';

		wait for 20 ns;
		
	end process;
	end behavior;
