library ieee;
use ieee.std_logic_1164.all;

entity FullAdder is
	port(
	b, a, ci: in bit;
	co, s: out bit
	);
end FullAdder;

architecture main of FullAdder is

begin

s <= (ci and not(b) and not(a)) or (not(ci) and b and not(a)) or (not(ci) and not(b) and a) or (ci and b and a);
co <= (a and b) or (a and ci) or (b and ci);

end architecture;