library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity myalu is
port(a, b: in std_logic_vector(7 downto 0);
	s: in std_logic_vector(7 downto 0);
	rout: out std_logic_vector(7 downto 0);
	c, z: out std_logic);
end myalu;

architecture bhv of myalu is
signal r1, r2: std_logic_vector(1 downto 0);
signal ins: std_logic_vector(3 downto 0);
begin
	process(a, b, s)
	begin
		ins <= s(7 downto 4); r1 <= s(3 downto 2); r2 <= s(1 downto 0);
		if(ins = "1001") then
			rout <= a+b;
		elsif(ins = "0110") then
			rout <= a-b;
		elsif(ins = "1110") then
			rout <= a or b;
		elsif(ins = "0101") then
			rout <= not a;
		elsif(ins = "1010" and r2 = "00") then
			rout <= '0'&a(7 downto 1);
			c <= a(0);
		elsif(ins = "1010" and r2 = "11") then
			rout <= a(6 downto 0)&'0';
			c <= a(7);
		end if;
	end process;
end bhv;
		