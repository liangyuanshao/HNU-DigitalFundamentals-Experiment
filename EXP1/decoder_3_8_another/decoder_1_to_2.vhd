library ieee;
use ieee.std_logic_1164.all;

entity decoder_1_to_2 is
port
(	a0: in std_logic;
	d1,d0: out std_logic
);
end;

architecture one of decoder_1_to_2 is
begin
	d0 <= not a0;
	d1 <= a0;
end;