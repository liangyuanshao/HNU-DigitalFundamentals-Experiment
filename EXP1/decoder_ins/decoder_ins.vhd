library ieee;
use ieee.std_logic_1164.all;

entity decoder_ins is
	port(i0, i1: in std_logic_vector(3 downto 0);
		e: in std_logic;
		MOVA, MOVB, MOVC, ALU, NOT0, SH, JMP, JZ, JC, IN0, OUT0, NOP, HEAL: out std_logic);
end decoder_ins;

architecture main of decoder_ins is
signal s:std_logic_vector(3 downto 0);
signal r1, r2: std_logic_vector(1 downto 0);
begin
	s <= i0; r1 <= i1(3 downto 2); r2 <= i1(1 downto 0);
	MOVA <= '1' when s = "0011" and r1 /= "11" and r2 /= "11" and e = '1' else '0';
	MOVB <= '1' when s = "0011" and r1 = "11" and r2 /= "11" and e = '1' else '0';
	MOVC <= '1' when s = "0011" and r1 /= "11" and r2 = "11" and e = '1' else '0';
	ALU <= '1' when (s = "1001" or s = "0110" or s = "1110") and e = '1' else '0';
	NOT0 <= '1' when s = "0101" and e = '1' else '0';
	SH <= '1' when s = "1010" and e = '1' else '0';
	JMP <= '1' when s = "0001" and r1 = "00" and r2 = "00" and e = '1' else '0';
	JZ <= '1' when s = "0001" and r1 = "00" and r2 = "01" and e = '1' else '0';
	JC <= '1' when s = "0001" and r1 = "00" and r2 = "10" and e = '1' else '0';
	IN0 <= '1' when s = "0010" and e = '1' else '0';
	OUT0 <= '1' when s = "0100" and e = '1' else '0';
	NOP <= '1' when s = "0111" and r1 = "00" and r2 = "00" and e = '1' else '0';
	HEAL <= '1' when s = "1000" and r1 = "00" and r2 = "00" and e = '1' else '0';
end main;
	