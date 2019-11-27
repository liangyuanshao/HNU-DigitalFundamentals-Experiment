library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity IR is
	port(ld, clk, en: in std_logic;
		a: in std_logic_vector(7 downto 0);
		x: out std_logic_vector(7 downto 0));
end IR;

architecture main of IR is
component mydff
	port(d, en, c: in std_logic;
		q: out std_logic);
end component;

signal tx: std_logic_vector(7 downto 0);
begin
	
	ge: for i in 7 downto 0 generate
		gi: mydff port map(a(i), ld, clk, tx(i));
	end generate;
	process(en)
	begin
		if(ld = '1' and en = '1') then
			x <= tx;
		end if;
	end process;
end main;