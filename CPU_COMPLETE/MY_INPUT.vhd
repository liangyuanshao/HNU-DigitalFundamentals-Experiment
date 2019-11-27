library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity MY_INPUT is
	port(EN_IN: in std_logic;
		INPUT_DATA: in std_logic_vector(7 downto 0);
		BUS_DATA: out std_logic_vector(7 downto 0));
end MY_INPUT;

architecture bhv of MY_INPUT is
begin
	BUS_DATA <= INPUT_DATA when EN_IN = '1' else "ZZZZZZZZ";
end bhv;