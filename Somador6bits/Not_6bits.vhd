library ieee;
use ieee.std_logic_1164.all;

entity Not_6bits is
	port(
	i0, i1, i2, i3, i4, i5: in bit;
	n0, n1, n2, n3, n4, n5: out bit
	);
end Not_6bits;

architecture main of Not_6bits is

begin

n0 <= not(i0);
n1 <= not(i1);
n2 <= not(i2);
n3 <= not(i3);
n4 <= not(i4);
n5 <= not(i5);

end architecture;