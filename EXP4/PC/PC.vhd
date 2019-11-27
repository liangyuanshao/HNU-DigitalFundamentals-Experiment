library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity PC is
	port(inpc, ldpc, clk: in std_logic;
		a: in std_logic_vector(7 downto 0);
		c: out std_logic_vector(7 downto 0));
end PC;

architecture bhv of PC is
signal pc_add: std_logic_vector(7 downto 0);
begin
	process(inpc, ldpc, clk, a)
	begin
		if(clk'event and clk = '1') then
			if(inpc = '1' and ldpc = '0') then	
				pc_add <= pc_add+1;
			elsif(inpc = '0' and ldpc = '1') then
				pc_add <= a;
			else
				pc_add <= pc_add;
			end if;
		end if;
	end process;
	c <= pc_add;
end bhv;