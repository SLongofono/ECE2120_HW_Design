library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity srlatch_tb is
--  Port ( );
end srlatch_tb;

architecture Behavioral of srlatch_tb is

signal r_int, s_int, q_int, qbar_int : STD_LOGIC;
constant t_per :time := 10ns;

component SR_latch_dataflow is
    Port(
        S : in STD_LOGIC;
        R : in STD_LOGIC;
        Q : inout STD_LOGIC;
        Qbar : inout STD_LOGIC
        );
end component;

begin

myLatch: SR_latch_dataflow
    port map(
        S => s_int,
        R => r_int,
        Q => q_int,
        Qbar => qbar_int
    );


main: process
begin
    r_int <= '0';
    s_int <= '0';
    wait for t_per;
    r_int <= '0';
    s_int <= '1';
    wait for t_per;
    r_int <= '0';
    s_int <= '0';
    wait for t_per;
    r_int <= '1';
    s_int <= '0';
    wait for t_per;
    r_int <= '0';
    s_int <= '1';
    wait for t_per;


    r_int <= '1';
    s_int <= '0';
    wait for t_per;
    r_int <= '0';
    s_int <= '1';
    wait for t_per;
    r_int <= '1';
    s_int <= '0';
    wait for t_per;
    r_int <= '1';
    s_int <= '1';
    wait for t_per;
    r_int <= '1';
    s_int <= '1';
    wait for t_per;


    r_int <= '0';
    s_int <= '0';
    wait for t_per;
    r_int <= '0';
    s_int <= '1';
    wait for t_per;
    r_int <= '0';
    s_int <= '0';
    wait for t_per;
    r_int <= '1';
    s_int <= '0';
    wait for t_per;
    r_int <= '0';
    s_int <= '1';
    wait for t_per;


    r_int <= '1';
    s_int <= '0';
    wait for t_per;
    r_int <= '0';
    s_int <= '1';
    wait for t_per;
    r_int <= '1';
    s_int <= '0';
    wait for t_per;
    r_int <= '1';
    s_int <= '1';
    wait for t_per;
    r_int <= '1';
    s_int <= '1';
    wait for t_per;
    
    
    r_int <= '0';
    s_int <= '0';
    wait for 50 ns;
end process;

end Behavioral;
