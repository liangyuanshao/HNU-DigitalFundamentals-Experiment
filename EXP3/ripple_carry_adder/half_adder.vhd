library ieee;
use ieee.std_logic_1164.all;

entity half_adder is
port(x, y: in std_logic;
	s, c: out std_logic);
end half_adder;

architecture bhv of half_adder is
begin
	s <= (not x and y) or (x and not y);
	c <= x and y;
end bhv;