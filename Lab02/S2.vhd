library ieee;
use ieee.std_logic_1164.all;

entity Lab02_2 is
	port(
		A, B, C: in bit;
		S2: out bit
);
end Lab02_2;

architecture main of Lab02_2 is

	signal mid_sign1: bit;
	signal mid_sign2: bit;
	signal mid_sign3: bit;
	signal mid_sign4: bit;

	-- Estrutura da porta AND de 3 entradas
	component And3In is
		port(
			in1, in2, in3: in bit;
			and_out: out bit
		);
	end component;
	
	-- Estrutura da porta OR de 4 entradas
	component Or4In is
		port(
			entry1, entry2, entry3, entry4: in bit;
			or_out: out bit
		);
	end component;
	
begin

	u1: And3In port map(in1 => not(A), in2 => not(B), in3 => C, and_out => mid_sign1);
	u2: And3In port map(in1 => not(A), in2 => B, in3 => not(C), and_out => mid_sign2);
	u3: And3In port map(in1 => not(B), in2 => A, in3 => not(C), and_out => mid_sign3);
	u4: And3In port map(in1 => A, in2 => B, in3 => C, and_out => mid_sign4);
	u5: Or4In port map(entry1 => mid_sign1, entry2 => mid_sign2, entry3 => mid_sign3, entry4 => mid_sign4, or_out => S2);
	
end architecture main;	