library ieee;
use ieee.std_logic_1164.all;

entity SixBits_adder is
	port(
		a0, a1, a2, a3, a4, a5: in bit;
		b0, b1, b2, b3, b4, b5: in bit;
		c0, c1, c2, c3, c4, c5: out bit
	);
end SixBits_adder;

architecture main of SixBits_adder is

component FullAdder is
	port(
	b, a, ci: in bit;
	co, s: out bit
	);
end component;

begin 

end architecture;