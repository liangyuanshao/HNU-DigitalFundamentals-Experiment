library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity PC is
	port(INPC, LDPC, CLK: in std_logic;
		BUS_DATA: in std_logic_vector(7 downto 0);
		PC_ADD: out std_logic_vector(7 downto 0));
end PC;

architecture bhv of PC is
signal ADD: std_logic_vector(7 downto 0);
begin
	process(INPC, LDPC, CLK, BUS_DATA)
	begin
		if(CLK'event and CLK = '0') then
			if(INPC = '1' and LDPC = '0') then	
				ADD <= ADD+1;
			elsif(INPC = '0' and LDPC = '1') then
				ADD <= BUS_DATA;
			else
				ADD <= ADD;
			end if;
		end if;
	end process;
	PC_ADD <= ADD;
end bhv;