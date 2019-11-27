library ieee;
use ieee.std_logic_1164.all;

entity srg4 is
port(si, r, c: in std_logic;
	so, a3, a2, a1, a0: out std_logic);
end srg4;

architecture bhv of srg4 is
signal data: std_logic_vector(3 downto 0);
begin
	process(r, c)
	begin
		if(r = '0') then
			data <= "0000";
		elsif(c'event and c = '1') then
			so <= data(0);
			data(0) <= data(1);
			data(1) <= data(2);
			data(2) <= data(3);
			data(3) <= si;
		end if;
		a3 <= data(3);
		a2 <= data(2);
		a1 <= data(1);
		a0 <= data(0);
	end process;
end bhv;