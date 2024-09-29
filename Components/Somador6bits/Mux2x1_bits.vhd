library ieee;
use ieee.std_logic_1164.all;

entity Mux2x1_6bits is
	port(
		a0, a1, a2, a3, a4, a5: in bit;
		b0, b1, b2, b3, b4, b5: in bit;
		c0, c1, c2, c3, c4, c5: out bit;
		cin: in bit
	);
end Mux2x1_6bits;

architecture main of Mux2x1_6bits is

begin 

process(cin)
begin
		case cin is
			when '1' =>
				c0 <= b0;
				c1 <= b1;
				c2 <= b2;
				c3 <= b3;
				c4 <= b4;
				c5 <= b5;
			when '0' =>
				c0 <= a0;
				c1 <= a1;
				c2 <= a2;
				c3 <= a3;
				c4 <= a4;
				c5 <= a5;
		end case;
	end process;

end architecture;