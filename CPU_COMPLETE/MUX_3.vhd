library ieee;
use ieee.std_logic_1164.all;

entity MUX_3 is
	port(S0, S1, S2: in std_logic_vector(7 downto 0);
		MADD: in std_logic_vector(1 downto 0);
		ADD: out std_logic_vector(7 downto 0));
end MUX_3;

architecture bhv of MUX_3 is
begin
	ADD <= S0 when MADD = "00" else
		 S1 when MADD = "01" else
		 S2 when MADD = "10" else
		 "ZZZZZZZZ";
end bhv;