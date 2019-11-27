library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity IR is
	port(I_IN: in std_logic_vector(7 downto 0);
		LDIR, CLK: in std_logic;
		I_OUT: out std_logic_vector(7 downto 0));
end IR;

architecture main of IR is
signal DATA: std_logic_vector(7 downto 0);
begin
	process(CLK, I_IN, LDIR)
	begin
		if(CLK'event and CLK = '0') then
			if(LDIR = '1') then
				DATA <= I_IN;
			else 
				DATA <= DATA;
			end if;
		end if;
	end process;
	I_OUT <= DATA;
end main;