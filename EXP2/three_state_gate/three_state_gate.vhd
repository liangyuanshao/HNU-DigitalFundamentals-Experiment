library ieee;
use ieee.std_logic_1164.all;

entity three_state_gate is
	port(en, in1: in std_logic;
		out1: out std_logic);
end three_state_gate;

architecture main of three_state_gate is
begin
	process(en, in1)
	begin
		if(en = '1') then out1 <= in1;
		else out1 <= 'Z';
		end if;
	end process;
end main;