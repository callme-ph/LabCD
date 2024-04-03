library ieee;
use ieee.std_logic_1164.all;

entity Lab03_BCD is
	port(
		A4, A3, A2, A1: in bit;
		S6, S5, S4, S3, S2, S1, S0: out bit
	);
end Lab03_BCD;

architecture main of Lab03_BCD is

begin

S0 <= (A1 and not(A2) and not(A3) and not(A4)) or (not(A1) and not(A2) and A3 and not(A4));
S1 <= (A1 and not(A2) and A3 and not(A4)) or (not(A1) and A2 and A3 and not(A4));
S2 <= (not(A1) and A2 and not(A3) and not(A4));
S3 <= (A1 and not(A2) and not(A3) and not(A4)) or (not(A1) and not(A2) and A3 and not(A4)) or (A1 and A2 and A3 and not(A4));
S4 <= (A1 and not(A2) and not(A3) and not(A4)) or (A1 and A2 and not(A3) and not(A4)) or (not(A1) and not(A2) and A3 and not(A4)) or (A1 and not(A2) and A3 and not(A4)) or (A1 and A2 and A3 and not(A4)) or (A1 and not(A2) and not(A3) and A4);
S5 <= (A1 and not(A2) and not(A3) and not(A4)) or (not(A1) and A2 and not(A3) and not(A4)) or (A1 and A2 and not(A3) and not(A4)) or (A1 and A2 and A3 and not(A4));
S6 <= (not(A1) and not(A2) and not(A3) and not(A4)) or (A1 and not(A2) and not(A3) and not(A4)) or (A1 and A2 and A3 and not(A4));

end architecture main;
