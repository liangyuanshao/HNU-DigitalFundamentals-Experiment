library ieee;
use ieee.std_logic_1164.all;

entity sr_latch is
port(r, s, c: in std_logic;
	q, qn: out std_logic);
end sr_latch;

architecture bhv of sr_latch is
signal nr, ns, tr, ts: std_logic;
begin
	ns <= s nand c;
	nr <= r nand c;
	ts <= nr nor tr;
	tr <= ns nor ts;
	q <= ts;
	qn <= tr;
end bhv;