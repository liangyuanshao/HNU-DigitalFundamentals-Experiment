library ieee;
use ieee.std_logic_1164.all;

entity ZCR is
port(C_EN, Z_EN, C_IN, Z_IN: in std_logic;
	C_OUT, Z_OUT: out std_logic);
end ZCR;

architecture bhv of ZCR is
signal C_DATA, Z_DATA: std_logic;
begin
	C_DATA <= C_IN when C_EN = '1' else C_DATA;
	Z_DATA <= Z_IN when Z_EN = '1' else Z_DATA;
	C_OUT <= C_DATA;
	Z_OUT <= Z_DATA;
end bhv;