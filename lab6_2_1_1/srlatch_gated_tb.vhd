library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity srlatch_gated_tb is
--  Port ( );
end srlatch_gated_tb;

architecture Behavioral of srlatch_gated_tb is

signal r_int, s_int, q_int, qbar_int, enable_int : STD_LOGIC;
constant t_per :time := 10ns;

component SR_latch_gated is
    Port(
        S : in STD_LOGIC;
        R : in STD_LOGIC;
		E : in STD_LOGIC;
        Q : out STD_LOGIC;
        Qbar : out STD_LOGIC
        );
end component;

begin

myLatch: SR_latch_gated
    port map(
        S => s_int,
        R => r_int,
		E => enable_int,
        Q => q_int,
        Qbar => qbar_int
    );


main: process
begin
    r_int <= '0';
    s_int <= '0';
    enable_int <= '0';
    wait for t_per;
    r_int <= '0';
    s_int <= '1';
    enable_int <= '0';
    wait for t_per;
    r_int <= '0';
    s_int <= '1';
    enable_int <= '1';
    wait for t_per;
    r_int <= '0';
    s_int <= '0';
    enable_int <= '1';
    wait for t_per;
    r_int <= '1';
    s_int <= '0';
    enable_int <= '1';
    wait for t_per;


    r_int <= '1';
    s_int <= '0';
    enable_int <= '0';
    wait for t_per;
    r_int <= '0';
    s_int <= '1';
    enable_int <= '0';
    wait for t_per;
    r_int <= '1';
    s_int <= '0';
    enable_int <= '0';
    wait for t_per;
    r_int <= '0';
    s_int <= '1';
    enable_int <= '0';
    wait for t_per;
    r_int <= '0';
    s_int <= '1';
    enable_int <= '1';
    wait for t_per;


    r_int <= '1';
    s_int <= '0';
    enable_int <= '1';
    wait for t_per;
    r_int <= '1';
    s_int <= '1';
    enable_int <= '1';
    wait for t_per;
    r_int <= '1';
    s_int <= '1';
    enable_int <= '1';
    wait for t_per;
    r_int <= '1';
    s_int <= '1';
    enable_int <= '1';
    wait for t_per;
    r_int <= '1';
    s_int <= '1';
    enable_int <= '1';
    wait for t_per;
    
    
    r_int <= '0';
    s_int <= '0';
    wait for 50 ns;
end process;

end Behavioral;
