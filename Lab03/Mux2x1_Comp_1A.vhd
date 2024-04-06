-- mux2x1 do exercicio 1)a)

library ieee;
use ieee.std_logic_1164.all;

entity Mux2x1_1A is
port(
		i0, i1, s0: in bit;
		s			 : out bit
	 );
end;

architecture behav of Mux2x1_1A is
begin
with s0 select
	s <= i0 when '0',
		  i1 when '1';
end;