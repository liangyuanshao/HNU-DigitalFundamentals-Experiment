library ieee;
use ieee.std_logic_1164.all;

entity mydff is
port(d, en, c: in std_logic;
	q: out std_logic);
end mydff;

architecture bhv of mydff is
begin
	process(en, c)
	begin
		if(en = '1') then
			if(c'event and c = '0') then
				q <= d;
			end if;
		end if;
	end process;
end bhv;