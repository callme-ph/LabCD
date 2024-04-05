-- Questão 1. c) do laboratório de Mutiplexadores e Codificadores

library ieee;
use ieee.std_logic_1164.all;

entity Mux4x1 is
port(
		in1, in2, in3, in4, s0: in bit;
		out1			 : out bit
	 );
end Mux4x1;

architecture behav of Mux4x1 is

signal mid_signal_1: bit;
signal mid_signal_2: bit;

component Mux is
	port(
		i0, i2, s0: in bit;
		s			 : out bit
	 );
end component;

begin

u1: Mux port map( i0 => in1, i2 => in2, s0 => s0, s => mid_signal_1 );
u2: Mux port map( i0 => in3, i2 => in4, s0 => s0, s => mid_signal_2 );
u3: Mux port map( i0 => mid_signal_1, i2 => mid_signal_2, s0 => s0, s => out1 );

end architecture behav;
