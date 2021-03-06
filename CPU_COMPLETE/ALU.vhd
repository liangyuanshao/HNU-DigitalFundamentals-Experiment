library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity ALU is
port(SM: in std_logic;
	A, B: in std_logic_vector(7 downto 0);
	S: in std_logic_vector(3 downto 0);
	M, F, FRL, FRR: in std_logic;
	ALU_OUT: out std_logic_vector(7 downto 0);
	C_EN, Z_EN, C, Z: out std_logic);
end ALU;

architecture bhv of ALU is
signal ALU_TMP: std_logic_vector(8 downto 0);
begin
	process(SM, A, B, S, M, F, FRL, FRR)
	begin
		ALU_OUT <= "ZZZZZZZZ";
		C_EN <= '0'; Z_EN <= '0';
		if(M = '1' and SM = '1') then
			Z_EN <= '1';
			if(S = "1001") then
				ALU_TMP <= ('0'&A)+('0'&B);
				C_EN <= '1';
				C <= ALU_TMP(8);
			elsif(S = "0110") then
				ALU_TMP <= ('0'&A)-('0'&B);
				C_EN <= '1';
				if(A < B) then
					C <= '1';
				else
					C <= '0';
				end if;
			elsif(S = "1011") then
				ALU_TMP <= '0'&A or B;
			elsif(S = "0101") then
				ALU_TMP <= '0'&not B;
			end if;
			if(ALU_TMP(7 downto 0) = "00000000") then
				Z <= '1';
			else
				Z <= '0';
			end if;
		elsif(M = '0' and SM = '1') then
			if(S = "1111") then
				ALU_TMP <= '0'&A;
			elsif(S = "1010") then
				if(FRL = '1') then
					ALU_OUT <= B(6 downto 0)&B(7);
					C_EN <= '1';
					C <= B(7);
				elsif(FRR = '1') then
					ALU_OUT <= B(7)&B(7 downto 1);
					C_EN <= '1';
					C <= B(0);
				end if;
			elsif(S = "0100") then
				ALU_TMP <= '0'&B;
			end if;
		end if;
		if(F = '1') then
			ALU_OUT <= ALU_TMP(7 downto 0);
		end if;
	end process;
end bhv;
		