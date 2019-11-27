library ieee;
use ieee.std_logic_1164.all;

entity serial_adder is
port(si, r, clk, shift: in std_logic;
	ans, ans2: out std_logic_vector(3 downto 0));
end serial_adder;

architecture bhv of serial_adder is
component srg4 is
port(si, r, c: in std_logic;
	so: out std_logic;
	ans: out std_logic_vector(3 downto 0));
end component;

component mydff is
port(d, r, c: in std_logic;
	q: out std_logic);
end component;

component full_adder is
port(x, y, z: in std_logic;
	s, c: out std_logic);
end component;

signal c, sia, soa, sob, d, q: std_logic;
signal tmp: std_logic_vector(3 downto 0);
begin
	c <= not shift or clk;
	g0: srg4 port map(si, r, c, sob, ans2);
	g1: full_adder port map(soa, sob, q, sia, d);
	g2: mydff port map(d, r, c, q);
	g3: srg4 port map(sia, r, c, soa, ans);  
end bhv;