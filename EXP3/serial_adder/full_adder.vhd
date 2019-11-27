library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
	port(x, y, z: in std_logic;
		s, c: out std_logic);
end full_adder;

architecture bhv of full_adder is
component half_adder is
	port(x, y: in std_logic;
		s, c: out std_logic);
end component;

signal ts, tc1, tc2: std_logic;
begin
	g0: half_adder port map(x, y, ts, tc1);
	g1: half_adder port map(ts, z, s, tc2);
	c <= tc1 or tc2;
end bhv;