library ieee;
use ieee.std_logic_1164.all;

entity my_xor_test is
	port(in1, in2: in std_logic;
		out1: out std_logic);
end my_xor_test;

architecture main of my_xor_test is

component my_xor is
	port(a, b: in std_logic;
		c: out std_logic);
end component;

begin
	g0: my_xor port map(in1, in2, out1);
end main;