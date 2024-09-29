library ieee;
use ieee.std_logic_1164.all;

entity calculadora is
	port(A5, A4, A3, A2, A1, A0		: in bit;
		  B5, B4, B3, B2, B1, B0		: in bit;
		  f, e, clk		 	  				: in bit;
		  L5, L4, L3, L2, L1, L0	: out bit); -- pinos do ultimo led
end calculadora;

architecture main of calculadora is

	signal S5, S4, S3, S2, S1, S0: bit; -- Separa cada valor da saída do registrador
	
	component SomadorSubtrator is
	port(
		a0, a1, a2, a3, a4, a5: in bit;
		b0, b1, b2, b3, b4, b5: in bit;
		c0, c1, c2, c3, c4, c5: out bit;
		cin: in bit
	);
	end component;
	
	component regist_6Bits is
		port(
			e5, e4, e3, e2, e1, e0, clk, ld : in bit;
			q5, q4, q3, q2, q1, q0 : out bit
		);
	end component;
	
	begin
	
	u1: SomadorSubtrator port map(a0 => A5, a1 => A4, a2 => A3, a3 => A2, a4 => A1, a5 => A0,
											b0 => B5, b1 => B4, b2 => B3, b3 => B2, b4 => B1, b5 => B0,
											c0 => S5, c1 => S4, c2 => S3, c3 => S2, c4 => S1, c5 => S0,
											cin => f);
	
	
	u2: regist_6Bits port map(e5 => S5, e4 => S4, e3 => S3, e2 => S2, e1 => S1, e0 => S0,
										q5 => L5, q4 => L4, q3 => L3, q2 => L2, q1 => L1, q0 => L0,
										clk => clk, ld => e);		
		
end architecture main;