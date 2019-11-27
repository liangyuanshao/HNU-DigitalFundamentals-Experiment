library ieee;
use ieee.std_logic_1164.all;

entity decoder_3_to_8 is
port
(	a2,a1,a0: in std_logic;
	d7,d6,d5,d4,d3,d2,d1,d0: out std_logic
);
end;

architecture one of decoder_3_to_8 is

signal t0,t1,k0,k1,k2,k3: std_logic;

component decoder_1_to_2 is
	port
	(	a0: in std_logic;
		d1,d0: out std_logic
	);
end component;

component decoder_2_to_4 is
	port
	(	a1,a0: in std_logic;
		d3,d2,d1,d0: out std_logic
	);
end component;

begin
	g0:decoder_2_to_4 port map(a2,a1,k3,k2,k1,k0);
	g1:decoder_1_to_2 port map(a0,t1,t0);
	
	d0 <= k0 and t0;
	d1 <= k0 and t1;
	d2 <= k1 and t0;
	d3 <= k1 and t1;
	d4 <= k2 and t0;		
	d5 <= k2 and t1;
	d6 <= k3 and t0;
	d7 <= k3 and t1;
end;