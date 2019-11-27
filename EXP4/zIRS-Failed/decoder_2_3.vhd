library ieee;
use ieee.std_logic_1164.all;

entity decoder_2_3 is
	port(a: in std_logic_vector(1 downto 0);
		y: out std_logic_vector(2 downto 0));
end decoder_2_3;

architecture main of decoder_2_3 is
begin
	with a select
	y <= "001" when "00",
		 "010" when "01", 
		 "100" when "10",
		 "000" when others;
end main;