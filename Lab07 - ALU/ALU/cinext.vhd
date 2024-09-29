library ieee;
use ieee.std_logic_1164.all;

entity cinext is
	port(
		x_cinx, y_cinx, z_cinx: in bit;
		cin_ext: out bit
	);
end cinext;

architecture main of cinext is

begin
cin_ext <= (not(x_cinx) and not(y_cinx) and z_cinx) or (not(x_cinx) and y_cinx and not(z_cinx));
end architecture;