library ieee;
use ieee.std_logic_1164.all;

entity CONTROLLER is
	port(SM: in std_logic;
		I: in std_logic_vector(7 downto 0);
		MOVA, MOVB, MOVC, ALU, NOT0, RSL, RSR, JMP, JZ, JC, IN0, OUT0, NOP, HEAL, C, Z: in std_logic;
		INPC, LDPC, LDIR, WE_GR, F, FRL, FRR, DL, XL, M: out std_logic;
		S: out std_logic_vector(3 downto 0);
		RWBA, RAA, MADD: out std_logic_vector(1 downto 0);
		EN_IN, EN_OUT, EN_SM: out std_logic);
end CONTROLLER;

architecture bhv of CONTROLLER is
begin
	INPC <= (NOT SM) OR (JC AND (NOT C)) OR (JZ AND (NOT Z));
	LDPC <= (JMP OR (JC AND C) OR (JZ AND Z)) AND SM;
	LDIR <= NOT SM;
	WE_GR <= NOT((MOVA OR MOVC OR ALU OR NOT0 OR RSL OR RSR OR IN0 ) AND SM);
	F <= MOVA OR MOVB OR ALU OR NOT0 OR OUT0;
	FRL <= RSL;
	FRR <= RSR;
	DL <= (NOT SM) OR MOVC OR JMP OR (JC AND C) OR (JZ AND Z);
	XL <= MOVB AND SM;
	M <= ALU OR NOT0;
	S <= I(7 downto 4);
	RWBA <= I(3 downto 2);
	RAA <= I(1 downto 0);
	MADD <= "01" when MOVC = '1' and SM = '1' else
		 "10" when MOVB = '1' and SM = '1' else
		 "00";
	EN_IN <= IN0;
	EN_OUT <= OUT0;
	EN_SM <= not HEAL;
end bhv;