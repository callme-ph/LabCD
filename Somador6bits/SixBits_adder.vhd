library ieee;
use ieee.std_logic_1164.all;

entity SixBits_adder is
	port(
		a0, a1, a2, a3, a4, a5: in bit;
		b0, b1, b2, b3, b4, b5: in bit;
		c0, c1, c2, c3, c4, c5: out bit;
		cin: in bit -- cin sera 1 quando for uma subtracao; 0 para adicao. deve ser conectado no cin do fulladder menos significativo
	);
end SixBits_adder;

architecture main of SixBits_adder is

signal v5: bit;
signal v4: bit;
signal v3: bit;
signal v2: bit;
signal v1: bit;
signal v0: bit;

component FullAdder is
	port(
	b, a, ci: in bit;
	co, s: out bit
	);
end component;

begin 

u5: FullAdder port map(b => b5, a => a5, ci => cin, s => c5, co => v5);
u4: FullAdder port map(b => b4, a => a4, ci => v5, s => c4, co => v4);
u3: FullAdder port map(b => b3, a => a3, ci => v4, s => c3, co => v3);
u2: FullAdder port map(b => b2, a => a2, ci => v3, s => c2, co => v2);
u1: FullAdder port map(b => b1, a => a1, ci => v2, s => c1, co => v1);
u0: FullAdder port map(b => b0, a => a0, ci => v1, s => c0, co => v0);

end architecture;