library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dlatch_tb is
--  Port ( );
end dlatch_tb;

architecture Behavioral of dlatch_tb is

signal d_int, q_int, qbar_int, enable_int : STD_LOGIC;
constant t_per :time := 10ns;

component D_latch is
    Port(
        D : in STD_LOGIC;
		E : in STD_LOGIC;
        Q : out STD_LOGIC;
        Qbar : out STD_LOGIC
        );
end component;

begin

myLatch: D_latch
    port map(
        D => d_int,
		E => enable_int,
        Q => q_int,
        Qbar => qbar_int
    );


main: process
begin
    d_int 		<= '0';
    enable_int 	<= '0';
    wait for t_per;
    d_int 		<= '1';
    enable_int 	<= '0';
    wait for t_per;
    d_int 		<= '1';
    enable_int 	<= '1';
    wait for t_per;
    d_int 		<= '0';
    enable_int 	<= '1';
    wait for t_per;
    d_int 		<= '1';
    enable_int 	<= '1';
    wait for t_per;

    d_int 		<= '1';
    enable_int 	<= '0';
    wait for t_per;
    d_int 		<= '0';
    enable_int 	<= '0';
    wait for t_per;
    d_int 		<= '1';
    enable_int 	<= '0';
    wait for t_per;
    d_int 		<= '0';
    enable_int 	<= '0';
    wait for t_per;
    d_int 		<= '0';
    enable_int 	<= '1';
    wait for t_per;

    d_int 		<= '1';
    enable_int 	<= '1';
    wait for t_per;
    d_int 		<= '0';
    enable_int 	<= '1';
    wait for t_per;
    d_int 		<= '0';
    enable_int 	<= '1';
    wait for t_per;
    d_int 		<= '0';
    enable_int 	<= '0';
    wait for t_per;
    d_int 		<= '1';
    enable_int 	<= '0';
    wait for t_per;

    d_int 		<= '1';
    enable_int 	<= '1';
    wait for t_per;
    d_int 		<= '0';
    enable_int 	<= '1';
    wait for t_per;
    d_int 		<= '1';
    enable_int 	<= '1';
    wait for t_per;
    d_int 		<= '1';
    enable_int 	<= '0';
    wait for t_per;
    d_int 		<= '0';
    enable_int 	<= '0';
    wait for t_per;


    wait for 50 ns;
end process;

end Behavioral;
