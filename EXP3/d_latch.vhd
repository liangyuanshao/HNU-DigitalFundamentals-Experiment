library ieee;
use ieee.std_logic_1164.all;

entity d_latch is
port(d, c: in std_logic;
	q, qn: out std_logic);
end d_latch;

architecture bhv of d_latch is
signal nr, ns, tr, ts: std_logic;
begin
	ns <= d nand c;
	nr <= not d nand c;
	tr <= nr nand ts;
	ts <= ns nand tr;
	q <= ts;
	qn <= tr;
end bhv;