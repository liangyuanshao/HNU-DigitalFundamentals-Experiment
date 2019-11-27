library ieee;
use ieee.std_logic_1164.all;

entity three_state_gate is
	port(ld0: in std_logic;
		in0: in std_logic_vector(7 downto 0);
		en0: in std_logic;
		out0: out std_logic_vector(7 downto 0));
end three_state_gate;

architecture main of three_state_gate is
begin
	out0 <= in0 when ld0 = '1' and en0 = '1' else "ZZZZZZZZ";
end main;