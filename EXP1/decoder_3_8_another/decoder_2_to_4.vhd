library ieee;
use ieee.std_logic_1164.all;

entity decoder_2_to_4 is
port
(	a1,a0: in std_logic;
	d3,d2,d1,d0: out std_logic
);
end;

architecture one of decoder_2_to_4 is

signal a1_n, a0_n: std_logic;
begin
	a0_n <= not a0;
	a1_n <= not a1;
	d0 <= a1_n and a0_n;
	d1 <= a1_n and a0;
	d2 <= a1 and a0_n;
	d3 <= a1 and a0;
end;