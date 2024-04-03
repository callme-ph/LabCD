library ieee;
use ieee.std_logic_1164.all;

-- Código comportamental para o decodificador BCD 

entity BCD_Comp is
	port(
		A4, A3, A2, A1: in bit;
		S6, S5, S4, S3, S2, S1, S0: out bit
	);
end BCD_Comp;

architecture main of BCD_Comp is

signal out_aux: bit_vector(6 downto 0);
signal in_aux: bit_vector(3 downto 0);

begin

in_aux <= A4 & A3 & A2 & A1;

with in_aux select

out_aux <= "1000000" when "0000",
 "1111001" when "0001", 
 "0100100" when "0010", 
 "0110000" when "0011", 
 "0011001" when "0100", 
 "0010010" when "0101",
 "0000010" when "0110",
 "1111000" when "0111",
 "0000000" when "1000",
 "0010000" when "1001",
 "0111111" when others;

S0 <= out_aux(6);
S1 <= out_aux(5);
S2 <= out_aux(4);
S3 <= out_aux(3);
S4 <= out_aux(2);
S5 <= out_aux(1);
S6 <= out_aux(0);

end architecture main;