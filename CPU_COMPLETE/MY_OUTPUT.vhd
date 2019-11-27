library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity MY_OUTPUT is
	port(EN_OUT: in std_logic;
		DATA: in std_logic_vector(7 downto 0);
		OUTPUT_DATA: out std_logic_vector(7 downto 0));
end MY_OUTPUT;

architecture bhv of MY_OUTPUT is
begin
	OUTPUT_DATA <= DATA when EN_OUT = '1' else "ZZZZZZZZ";
end bhv;