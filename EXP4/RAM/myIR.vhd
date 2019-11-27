library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity myIR is
	port(ld, clk: in std_logic;
		a: in std_logic_vector(7 downto 0);
		x: out std_logic_vector(7 downto 0));
end myIR;

architecture main of myIR is
component mydff
	port(d, en, c: in std_logic;
		q: out std_logic);
end component;

begin
	ge: for i in 7 downto 0 generate
		gi: mydff port map(a(i), ld, clk, x(i));
	end generate;
end main;