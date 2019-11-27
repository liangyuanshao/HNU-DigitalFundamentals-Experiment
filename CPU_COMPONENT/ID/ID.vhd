library ieee;
use ieee.std_logic_1164.all;

entity ID is
	port(I_IN: in std_logic_vector(7 downto 0);
		SM: in std_logic;
		I_OUT: out std_logic_vector(7 downto 0);
		MOVA, MOVB, MOVC, ALU, NOT0, RSL, RSR, JMP, JZ, JC, IN0, OUT0, NOP, HEAL: out std_logic);
end ID;

architecture main of ID is
signal s: std_logic_vector(3 downto 0);
signal r1, r2: std_logic_vector(1 downto 0);
begin
	s <= I_IN(7 downto 4); r1 <= I_IN(3 downto 2); r2 <= I_IN(1 downto 0);
	MOVA <= '1' when s = "1111" and r1 /= "11" and r2 /= "11" and SM = '1' else '0';
	MOVB <= '1' when s = "1111" and r1 = "11" and r2 /= "11" and SM = '1' else '0';
	MOVC <= '1' when s = "1111" and r1 /= "11" and r2 = "11" and SM = '1' else '0';
	ALU <= '1' when (s = "1001" or s = "0110" or s = "1011") and SM = '1' else '0';
	NOT0 <= '1' when s = "0101" and SM = '1' else '0';
	RSL <= '1' when s = "1010" and r2 = "11" and SM = '1' else '0';
	RSR <= '1' when s = "1010" and r2 = "00" and SM = '1' else '0';
	JMP <= '1' when s = "0001" and r1 = "00" and r2 = "00" and SM = '1' else '0';
	JZ <= '1' when s = "0001" and r1 = "00" and r2 = "01" and SM = '1' else '0';
	JC <= '1' when s = "0001" and r1 = "00" and r2 = "10" and SM = '1' else '0';
	IN0 <= '1' when s = "0010" and SM = '1' else '0';
	OUT0 <= '1' when s = "0100" and SM = '1' else '0';
	NOP <= '1' when s = "0111" and r1 = "00" and r2 = "00" and SM = '1' else '0';
	HEAL <= '1' when s = "1000" and r1 = "00" and r2 = "00" and SM = '1' else '0';
	I_OUT <= I_IN;
end main;
	