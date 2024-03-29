library ieee;
use ieee.std_logic_1164.all;

entity lab02_gates is
	port(
		a, b ,c: in bit;
		s1: out bit
	);
end lab02_gates;

architecture main of lab02_gates is

	signal mid_sign1: bit; -- Linha que recebe a saida do primeiro AND
	signal mid_sign2: bit; -- Linha que recebe a saida do segundo AND
	signal mid_sign3: bit; -- Linha que recebe a saida do terceiro AND
	
	-- Componente que descreve a porta And de duas entradas
	component And2In is
		port(
			en1, en2:	in bit;
			and_out:		out bit 
		);
	end component;
	
	-- Componente que descreve a porta Or de três entradas
	component Or3In is
		port(
			entry1, entry2, entry3: in bit;
			or_out: 						out bit
		);
	end component;
	
begin 
	
	u1: And2In port map(en1 => a, en2 => b, and_out => mid_sign1); -- Definindo as ligações da porta And usando o componente/estrutura And2In
	u2: And2In port map(en1 => a, en2 => c, and_out => mid_sign2); 
	u3: And2In port map(en1 => b, en2 => c, and_out => mid_sign3);
	u4: Or3In port map(entry1 => mid_sign1, entry2 => mid_sign2, entry3 => mid_sign3, or_out => s1); -- Definindo as ligaçoes da porta Or usando o componente/estrutura Or3In

end architecture main;