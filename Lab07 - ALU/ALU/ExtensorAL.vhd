library ieee;
use ieee.std_logic_1164.all;

entity ExtensorAL is
	port(
		A_5, A_4, A_3, A_2, A_1, A_0: in bit;
		B_5, B_4, B_3, B_2, B_1, B_0: in bit;
		X_EAL, Y_EAL, Z_EAL: in bit;
		IA5, IA4, IA3, IA2, IA1, IA0: out bit;
		IB5, IB4, IB3, IB2, IB1, IB0: out bit;
		cin_eal: out bit
	);
end ExtensorAL;

architecture main of ExtensorAL is

component cinext is
	port(
		x_cinx, y_cinx, z_cinx: in bit;
		cin_ext: out bit
	);
end component;

component abext is
	port(
	a_ex, b_ex, x_abx, y_abx, z_abx: in bit;
		ia, ib: out bit
	);
end component;

begin

u5: abext port map(a_ex => A_5, b_ex => B_5, x_abx => X_EAL, y_abx => Y_EAL, z_abx => Z_EAL, ia => IA5, ib => IB5);
u4: abext port map(a_ex => A_4, b_ex => B_4, x_abx => X_EAL, y_abx => Y_EAL, z_abx => Z_EAL, ia => IA4, ib => IB4);
u3: abext port map(a_ex => A_3, b_ex => B_3, x_abx => X_EAL, y_abx => Y_EAL, z_abx => Z_EAL, ia => IA3, ib => IB3);
u2: abext port map(a_ex => A_2, b_ex => B_2, x_abx => X_EAL, y_abx => Y_EAL, z_abx => Z_EAL, ia => IA2, ib => IB2);
u1: abext port map(a_ex => A_1, b_ex => B_1, x_abx => X_EAL, y_abx => Y_EAL, z_abx => Z_EAL, ia => IA1, ib => IB1);
u0: abext port map(a_ex => A_0, b_ex => B_0, x_abx => X_EAL, y_abx => Y_EAL, z_abx => Z_EAL, ia => IA0, ib => IB0);

c1: cinext port map(x_cinx => X_EAL, y_cinx => Y_EAL, z_cinx => Z_EAL, cin_ext => cin_eal);

end architecture;