library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity IRS is
	port(we, clk: in std_logic;
		ra, wa: in std_logic_vector(1 downto 0);
		i: in std_logic_vector(7 downto 0);
		ao, bo: out std_logic_vector(7 downto 0));
end IRS;

architecture bhv of IRS is
component IR
	port(ld, clk, en: in std_logic;
		a: in std_logic_vector(7 downto 0);
		x: out std_logic_vector(7 downto 0));
end component;

component mux_3
	port(ld, clk: in std_logic;
		s0, s1, s2: in std_logic_vector(7 downto 0); 
		en: in std_logic_vector(2 downto 0);
		y: out std_logic_vector(7 downto 0));
end component;

component decoder_2_3
	port(a: in std_logic_vector(1 downto 0);
		y: out std_logic_vector(2 downto 0));
end component;

signal en_r1, en_r2: std_logic_vector(2 downto 0);
signal ir0, ir1, ir2: std_logic_vector(7 downto 0);
begin
	dec0: decoder_2_3 port map(ra, en_r1);
	dec1: decoder_2_3 port map(wa, en_r2);
	reg0: IR port map(not we, en_r2(0), clk, i, ir0);
	reg1: IR port map(not we, en_r2(1), clk, i, ir1);
	reg2: IR port map(not we, en_r2(2), clk, i, ir2);
	mux0: mux_3 port map(we, clk, ir0, ir1, ir2, en_r1, ao);
	mux1: mux_3 port map(we, clk, ir0, ir1, ir2, en_r2, bo);
end bhv;