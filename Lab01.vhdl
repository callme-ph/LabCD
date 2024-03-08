-- Biblioteca e pacotes
library ieee;
use ieee.std_logic_1164.all;

-- Entidade
entity and_gate is
	port(
		a, b, c : in bit;
		s1, s2, s3, s4, s5, s6, s7 : out bit
	
);
end and_gate;

architecture main of and_gate is

begin

	-- Postulados da Identidade
	s1 <= a or '0'; -- a + 0
	s2 <= a and '1'; -- a * 1
	s3 <= not(not(a)); -- (a')'

	-- Postulados da comutatividade
	-- Adiçao
	s4 <= a or b; -- a or b 
	s5 <= b or a; -- b or a
	
	-- Multiplicaçao
	s6 <= b and a; -- b and a
	s7 <= a and b; -- a and b
	
	-- Postulados da associatividade
	-- Adiçao
	s8 <= a or (b or c); -- a + (b + c)
	s9 <= (a or b) or c; -- (a + b) +c
	
	--Multiplicaçao
	s10 <= a and (b and c); -- 
	s11 <= (a and b) and

end architecture main;
