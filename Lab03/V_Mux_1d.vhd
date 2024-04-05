-- Questão 1d do Laboratório 3 sobre Mutiplexadores e Decodificadores

library ieee;
use ieee.std_logic_1164.all;

entity V_Mux is
	port(
	input1, input2: bit_vector(3 downto 0);
	output1: out bit_vector(3 downto 0);
	switch: in bit
	);
end V_Mux;

architecture main of V_Mux is

signal aux_v: bit_vector(3 downto 0);
signal aux_v2: bit_vector( 3 downto 0);

begin

aux_v(0) <= (input1(0) and switch) or (not(switch) and input2(0));
aux_v(1) <= (input1(1) and switch) or (not(switch) and input2(1));
aux_v(2) <= (input1(2) and switch) or (not(switch) and input2(2));
aux_v(3) <= (input1(3) and switch) or (not(switch) and input2(3));

output1(0) <= aux_v(0);
output1(1) <= aux_v(1);
output1(2) <= aux_v(2);
output1(3) <= aux_v(3);

end architecture main;
