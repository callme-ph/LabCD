library ieee;
use ieee.std_logic_1164.all;

entity EntCalc is
	port(A5, A4, A3, A2, A1, A0		: in bit;
		  B5, B4, B3, B2, B1, B0		: in bit;
		  x, y, z, e, clk		 	  				: in bit;
		  L6, L5, L4, L3, L2, L1, L0	: out bit); -- pinos do ultimo led
end EntCalc;

architecture main of EntCalc is

	signal S6, S5, S4, S3, S2, S1, S0: bit; -- Separa cada valor da saída do registrador
	
	component ALU is
		port(
			A_alu, B_alu : in bit_vector(5 downto 0);
			x_alu, y_alu, z_alu : in bit;
			S_alu : out bit_vector(5 downto 0)
		);
	end component;
	
	component regist_6Bits is
		port(
			e5, e4, e3, e2, e1, e0, clk, ld : in bit;
			q5, q4, q3, q2, q1, q0 : out bit
		);
	end component;
	
	begin
	
	u1: ALU port map(A_alu(5) => A5, A_alu(4) => A4, A_alu(3) => A3, A_alu(2) => A2, A_alu(1) => A1, A_alu(0) => A0,
											B_alu(5) => B5, B_alu(4) => B4, B_alu(3) => B3, B_alu(2) => B2, B_alu(1) => B1, B_alu(0) => B0,
											S_alu(5) => S5, S_alu(4) => S4, S_alu(3) => S3, S_alu(2) => S2, S_alu(1) => S1, S_alu(0) => S0,
											x_alu => x, y_alu => y, z_alu => z);
	
	
	u2: regist_6Bits port map(e5 => S5, e4 => S4, e3 => S3, e2 => S2, e1 => S1, e0 => S0,
										q5 => L5, q4 => L4, q3 => L3, q2 => L2, q1 => L1, q0 => L0,
										clk => clk, ld => e);		
		
end architecture main;