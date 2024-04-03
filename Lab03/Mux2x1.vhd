--library ieee;
--use ieee.std_logic_1164.all;

entity Mux is
port(
		i0, i2, s0: in bit;
		s			 : out bit
	 );
end Mux;

architecture behav of Mux is

begin

s <= (i0 and not(s0)) or (i2 and s0);

end architecture behav;