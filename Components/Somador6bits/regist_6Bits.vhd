library ieee;
use ieee.std_logic_1164.all;

entity regist_6Bits is
port(
	e5, e4, e3, e2, e1, e0, clk, ld : in bit;
	q5, q4, q3, q2, q1, q0 : out bit
	);
end;

architecture behav of regist_6Bits is
begin
--process(e5, e4, e3, e2, e1, e0, clk)
process(clk)
begin
	if(clk ' EVENT and clk = '1' and ld = '1') then
		q5 <= e5;
		q4 <= e4;
		q3 <= e3;
		q2 <= e2;
		q1 <= e1;
		q0 <= e0;
	end if;
end process;
end;