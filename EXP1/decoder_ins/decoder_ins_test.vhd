library ieee;
use ieee.std_logic_1164.all;

entity decoder_ins_test is
	port(ir: in std_logic_vector(7 downto 0);
		en: in std_logic;
		mova, movb, movc, add, sub, and0,
		not0,shr, shl, jmp, jz, jc, in0,
		out0, nop0, halt0: out std_logic);
end decoder_ins_test;

architecture main of decoder_ins_test is

component decoder_ins is
	port(i: in std_logic_vector(7 downto 0);
		e: in std_logic;
		move_r1_r2, move_m_r2, move_r1_m, add_r1_r2, 
		sub_r1_r2, and_r1_r2, not_r1, shr_r1, shl_r1,
		jmp_add, jz_add, jc_add, in_r1, out_r1, nop,
		halt: out std_logic);
end component;

begin
	g0: decoder_ins port map(ir, en, mova, movb, movc, 
		add, sub, and0, not0,shr, shl, jmp, jz, jc, in0,
		out0, nop0, halt0);
end main;
