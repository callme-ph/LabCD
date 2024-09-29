library ieee;
use ieee.std_logic_1164.all;

entity abext is
	port(
		a_ex, b_ex, x_abx, y_abx, z_abx: in bit;
		ia, ib: out bit
	);
end abext;

architecture main of abext is

begin
ia <= (a_ex and b_ex and not(y_abx)) or (a_ex and not(b_ex) and y_abx and not(z_abx)) or (a_ex and not(x_abx)) or (a_ex and not(y_abx) and z_abx) or (not(a_ex) and b_ex and x_abx and y_abx) or (not(a_ex) and x_abx and y_abx and z_abx) or (b_ex and x_abx and not(y_abx) and z_abx);
ib <= (not(x_abx) and not(y_abx) and not(z_abx) and b_ex) or (not(x_abx) and not(y_abx) and z_abx and not(b_ex));

end architecture;