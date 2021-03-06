library ieee;
use ieee.std_logic_1164.all;

entity multiplexing is
	port(s: in std_logic;
		i: in std_logic_vector(1 downto 0);
		y: out std_logic);
end multiplexing;

architecture main of multiplexing is
		
component three_state_gate
	port(en, in1: in std_logic;
		out1: out std_logic);
end component;

signal s_n: std_logic;
begin
	s_n <= not s;
	g0: three_state_gate port map(i(1), s, y);
	g1: three_state_gate port map(i(0), s_n, y);
end main;