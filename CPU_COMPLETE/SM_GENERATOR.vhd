library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity SM_GENERATOR is
	port(CLK, EN_SM: in std_logic;
		SM: out std_logic);
end SM_GENERATOR;

architecture bhv of SM_GENERATOR is
signal TMP: std_logic;
begin
	process(CLK, EN_SM)
	begin
		if(CLK'event and CLK = '0') then 
			if(EN_SM = '1') then
				TMP <= not TMP;
			end if;
		end if;
	end process;
	SM <= TMP;
end bhv;