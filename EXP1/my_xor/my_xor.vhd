library ieee;
use ieee.std_logic_1164.all;

entity my_xor is
	port(
		a, b: in std_logic;
		c: out std_logic
	);
end my_xor;

architecture main of my_xor is
signal an, bn: std_logic;
begin
	an <= a and (not b);
	bn <= b and (not a);
	c <= an or bn;
end main;