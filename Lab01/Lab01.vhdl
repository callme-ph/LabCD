-- Biblioteca e pacotes
library ieee;
use ieee.std_logic_1164.all;

-- Entidade
entity and_gate is
	port(
		a, b, c : in bit;
		s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12 : out bit
	
);
end and_gate;

architecture main of and_gate is

begin

	-- Postulados da Identidade
	s1 <= a or '0'; -- a + 0
	s2 <= a and '1'; -- a * 1
	s3 <= not(not(a)); -- (a')'

	-- Propriedade comutativa
	-- Adiçao
	s4 <= a or b; -- a + b 
	s5 <= b or a; -- b + a
	
	-- Multiplicaçao
	s6 <= b and a; -- b * a
	s7 <= a and b; -- a * b
	
	-- Propriedade associativa
	-- Adiçao
	s8 <= a or (b or c); -- a + (b + c)
	s9 <= (a or b) or c; -- (a + b) + c
	
	--Multiplicaçao
	s10 <= a and (b and c); -- a * (b * c)
	s11 <= (a and b) and c; -- (a * b) * c

	-- Propriedade distributiva
	-- Multiplicaçao
	s12 <= a and (b or c); -- a * (b + c)
	s13 <= (a and b) or (a and c); -- a*b + a*c
	
	-- Adiçao
	s14 <= a or (b and c); -- a + (b * c)
	s15 <= (a or b) and (a or c); -- (a + b) * (a + c)

	-- Teoremas de Morgan
	-- Primeira Lei
	s16 <= not(a and b); -- (a * b)'
	s17 <= not(a) or not(b); -- a' + b'

	--Segunda Lei
	s18 <= not(a or b); -- (a + b)'
	s19 <= not(a) and not(b); -- a' * b'

end architecture main;
