library ieee;
use ieee.std_logic_1164.all;

entity decoder_3_8_test is
	port(p: in std_logic_vector(2 downto 0);
		q: out std_logic_vector(7 downto 0));
end decoder_3_8_test;

architecture main of decoder_3_8_test is

component decoder_3_8 is
	port(a: in std_logic_vector(2 downto 0);
		y: out std_logic_vector(7 downto 0));
end component;

begin
	g0: decoder_3_8 port map(p, q);
end main;