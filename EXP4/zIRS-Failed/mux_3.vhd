library ieee;
use ieee.std_logic_1164.all;

entity mux_3 is
	port(ld, clk: in std_logic;
		s0, s1, s2: in std_logic_vector(7 downto 0); 
		en: in std_logic_vector(2 downto 0);
		y: out std_logic_vector(7 downto 0));
end mux_3;

architecture main of mux_3 is
component three_state_gate 
	port(ld0: in std_logic;
		in0: in std_logic_vector(7 downto 0);
		en0: in std_logic;
		out0: out std_logic_vector(7 downto 0));
end component;

signal ty: std_logic_vector(7 downto 0);
begin
	g0: three_state_gate port map(ld, s0, en(0), ty);
	g1: three_state_gate port map(ld, s1, en(1), ty);
	g2: three_state_gate port map(ld, s2, en(2), ty);
	process(ty)
	begin
		if(clk'event and clk = '0' and ld = '1') then
			y <= ty;
		end if;
	end process;
end main;