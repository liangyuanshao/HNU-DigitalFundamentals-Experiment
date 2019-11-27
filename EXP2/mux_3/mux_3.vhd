library ieee;
use ieee.std_logic_1164.all;

entity mux_3 is
	port(s0, s1, s2: in std_logic_vector(7 downto 0);
		en: in std_logic_vector(1 downto 0);
		y: out std_logic_vector(7 downto 0));
end mux_3;

architecture main of mux_3 is
component three_state_gate 
	port(in0: in std_logic_vector(7 downto 0);
		en0: in std_logic;
		out0: out std_logic_vector(7 downto 0));
end component;

signal enable: std_logic_vector(2 downto 0);
begin
	process(en)
	begin
		enable <= "000";
		if(en = "00") then enable(0) <= '1';
		elsif(en = "01") then enable(1) <= '1';
		elsif(en = "10") then enable(2) <= '1';
		end if;
	end process;
	g0: three_state_gate port map(s0, enable(0), y);
	g1: three_state_gate port map(s1, enable(1), y);
	g2: three_state_gate port map(s2, enable(2), y);
end main;