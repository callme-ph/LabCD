library ieee;
use ieee.std_logic_1164.all;

entity ALU is
port(
	A_alu, B_alu : in bit_vector(5 downto 0);
	x_alu, y_alu, z_alu : in bit;
	S_alu : out bit_vector(5 downto 0)
);
end;

architecture behav of ALU is

signal I_A0, I_A1, I_A2, I_A3, I_A4, I_A5: bit;
signal I_B0, I_B1, I_B2, I_B3, I_B4, I_B5: bit;
signal cin_sign: bit;

component SixBits_adder is
port(
		a0, a1, a2, a3, a4, a5: in bit;
		b0, b1, b2, b3, b4, b5: in bit;
		c0, c1, c2, c3, c4, c5: out bit;
		adder_cin: in bit -- adder_cin sera 1 quando for uma subtracao; 0 para adicao. deve ser conectado no cin do fulladder menos significativo
	
);
end component;

component ExtensorAL is
port(	A_5, A_4, A_3, A_2, A_1, A_0: in bit;
		B_5, B_4, B_3, B_2, B_1, B_0: in bit;
		X_EAL, Y_EAL, Z_EAL: in bit;
		IA5, IA4, IA3, IA2, IA1, IA0: out bit;
		IB5, IB4, IB3, IB2, IB1, IB0: out bit;
		cin_eal: out bit
		);
end component;

begin
u0 : SixBits_adder port map(a0 => I_A0, b0 => I_B0, c0 => S_alu(5), adder_cin => cin_sign, 
										a1 => I_A1, b1 => I_B1, c1 => S_alu(4),
										a2 => I_A2, b2 => I_B2, c2 => S_alu(3),
										a3 => I_A3, b3 => I_B3, c3 => S_alu(2),
										a4 => I_A4, b4 => I_B4, c4 => S_alu(1),
										a5 => I_A5, b5 => I_B5, c5 => S_alu(0));

e0 : ExtensorAL port map(A_5 => A_alu(5), B_5 => B_alu(5), IA5 => I_A0, IB5 => I_B0,
									A_4 => A_alu(4), B_4 => B_alu(4), IA4 => I_A1, IB4 => I_B1,
									A_3 => A_alu(3), B_3 => B_alu(3), IA3 => I_A2, IB3 => I_B2,
									A_2 => A_alu(2), B_2 => B_alu(2), IA2 => I_A3, IB2 => I_B3,
									A_1 => A_alu(1), B_1 => B_alu(1), IA1 => I_A4, IB1 => I_B4,
									A_0 => A_alu(0), B_0 => B_alu(0), IA0 => I_A5, IB0 => I_B5,
									X_EAL => x_alu, Y_EAL => y_alu, Z_EAL => z_alu, cin_eal => cin_sign);

end architecture;