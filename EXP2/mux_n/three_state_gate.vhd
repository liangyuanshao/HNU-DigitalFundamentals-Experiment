library ieee;
use ieee.std_logic_1164.all;

entity three_state_gate is
	port(in0, en0: in std_logic;
		out0: out std_logic);
end three_state_gate;

architecture main of three_state_gate is
begin
	out0 <= in0 when en0 = '1' else 'Z';
end main;