library ieee;
use ieee.std_logic_1164.all;

-- Código comportamental para o decodificador BCD 

entity decoder4to16 is
	port(
		A4, A3, A2, A1, E: in bit;
		S: out bit_vector(15 downto 0)
	);
end decoder4to16;

architecture main of decoder4to16 is

signal out_aux: bit_vector(15 downto 0);
signal in_aux: bit_vector(3 downto 0);

begin

in_aux <= A4 & A3 & A2 & A1;

with in_aux select

out_aux <= "1000000000000000" when "0000",
 "0100000000000000" when "0001", 
 "0010000000000000" when "0010", 
 "0001000000000000" when "0011", 
 "0000100000000000" when "0100", 
 "0000010000000000" when "0101",
 "0000001000000000" when "0110",
 "0000000100000000" when "0111",
 "0000000010000000" when "1000",
 "0000000001000000" when "1001",
 "0000000000100000" when "1010",
 "0000000000010000" when "1011",
 "0000000000001000" when "1100",
 "0000000000000100" when "1101",
 "0000000000000010" when "1110",
 "0000000000000001" when "1111";
 
end architecture main;