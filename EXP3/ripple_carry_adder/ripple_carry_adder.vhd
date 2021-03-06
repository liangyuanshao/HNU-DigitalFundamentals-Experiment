library ieee;
use ieee.std_logic_1164.all;

entity ripple_carry_adder is
	port(a, b: in std_logic_vector(3 downto 0);
		c0: in std_logic;
		s: out std_logic_vector(3 downto 0);
		c4: out std_logic);
end ripple_carry_adder;

architecture bhv of ripple_carry_adder is
component full_adder is
	port(x, y, z: in std_logic;
		s, c: out std_logic);
end component;

signal tc: std_logic_vector(4 downto 0);
begin
	tc(0) <= c0;
	G: for i in 0 to 3 generate
		gi: full_adder port map(a(i), b(i), tc(i), s(i), tc(i+1));
	end generate;
	c4 <= tc(4);
end bhv;