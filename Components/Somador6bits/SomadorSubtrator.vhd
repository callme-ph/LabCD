library ieee;
use ieee.std_logic_1164.all;

entity SomadorSubtrator is
	port(
		a0, a1, a2, a3, a4, a5: in bit;
		b0, b1, b2, b3, b4, b5: in bit;
		c0, c1, c2, c3, c4, c5: out bit;
		cin: in bit
	);
end SomadorSubtrator;

architecture main of SomadorSubtrator is

-- Sinais usados para ligar Entrada do SomadorSubtrator para a entrada do Not_6bits
signal S_to_Not0: bit;
signal S_to_Not1: bit;
signal S_to_Not2: bit;
signal S_to_Not3: bit;
signal S_to_Not4: bit;
signal S_to_Not5: bit;

-- Sinais usados para ligar a saída do Not_6bits na segunda entrada do Mux2x1_6bits
signal Not_to_Mux0: bit;
signal Not_to_Mux1: bit;
signal Not_to_Mux2: bit;
signal Not_to_Mux3: bit;
signal Not_to_Mux4: bit;
signal Not_to_Mux5: bit;

-- Sinais usados para ligar a saida do Mux2x1_6bits as entradas b's do SixBits_Adder
signal Mux_to_Adder0: bit;
signal Mux_to_Adder1: bit;
signal Mux_to_Adder2: bit;
signal Mux_to_Adder3: bit;
signal Mux_to_Adder4: bit;
signal Mux_to_Adder5: bit;

component Not_6bits is
	port(
	i0, i1, i2, i3, i4, i5: in bit;
	n0, n1, n2, n3, n4, n5: out bit
	);
end component;

component Mux2x1_6bits is
	port(
		a0, a1, a2, a3, a4, a5: in bit;
		b0, b1, b2, b3, b4, b5: in bit;
		c0, c1, c2, c3, c4, c5: out bit;
		cin: in bit
	);
end component;

component SixBits_adder is
	port(
		a0, a1, a2, a3, a4, a5: in bit;
		b0, b1, b2, b3, b4, b5: in bit;
		c0, c1, c2, c3, c4, c5: out bit;
		cin: in bit 
	);
end component;

begin


--Primeiro, ligar as entradas b's do SomadorSubtrator as entradas do Not_6bits
-- ligar as entradas b aos sinais auxiliares
S_to_Not0 <= b0;
S_to_Not1 <= b1;
S_to_Not2 <= b2;
S_to_Not3 <= b3;
S_to_Not4 <= b4;
S_to_Not5 <= b5;

-- Ligar os auxiliares ás entradas do Not_6bits e as saidas aos sinais auxiliares que serao ligados ao Mux2x1_6bits
u3: Not_6bits port map( i0 => S_to_Not0, i1 => S_to_Not1, i2 => S_to_Not2, i3 => S_to_Not3, i4 => S_to_Not4, i5 => S_to_Not5,
								n0 => Not_to_Mux0, n1 => Not_to_Mux1, n2 => Not_to_Mux2, n3 => Not_to_Mux3, n4 => Not_to_Mux4, n5 => Not_to_Mux5);

-- Segundo, fazer as conexoes no Mux2x1_6bits
-- As entradas b's do SomadorSubtrator conectam direto nas entradas a's do Mux
-- Os sinais auxiliares Not_to_Mux's conectam nas entradas b's do Mux
-- As saidas do Mux serao conectadas nas entradas b's do SixBits_Adder usando sinais auxiliares
u4: Mux2x1_6bits port map( a0 => b0, a1 => b1, a2 => b2, a3 => b3, a4 => b4, a5 => b5,
									b0 => Not_to_Mux0, b1 => Not_to_Mux1, b2 => Not_to_Mux2, b3 => Not_to_Mux3, b4 => Not_to_Mux4, b5 => Not_to_Mux5,
									c0 => Mux_to_Adder0, c1 => Mux_to_Adder1, c2 => Mux_to_Adder2, c3 => Mux_to_Adder3, c4 => Mux_to_Adder4, c5 => Mux_to_Adder5,
									cin => cin);


--Terceiro, ligar as entradas a's do SomadorSubtrator as entradas a's SixBits_adder
--Ligar os sinais auxiliares Mux_to_Adder's as entradas b's do SixBits_Adder
--Ligar as saidas c's do SixBits_Adder nas saidas c's do SomadorSubtrator
u1: SixBits_Adder port map(a0 => a0, a1 => a1, a2 => a2, a3 => a3, a4 => a4, a5 => a5,
									b0 => Mux_to_Adder0, b1 => Mux_to_Adder1, b2 => Mux_to_Adder2, b3 => Mux_to_Adder3, b4 => Mux_to_Adder4, b5 => Mux_to_Adder5,
									c0 => c0, c1 => c1, c2 => c2, c3 => c3, c4 => c4, c5 => c5,
									cin => cin);

end architecture;
