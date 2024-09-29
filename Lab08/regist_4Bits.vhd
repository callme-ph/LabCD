library ieee;
use ieee.std_logic_1164.all;

entity regist_4Bits is
port(
	e: in STD_LOGIC_VECTOR(3 DOWNTO 0);
	clk, ld : in STD_LOGIC;
	q: out STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
end;

architecture behav of regist_4Bits is
begin
process(e, clk)
begin
	if(clk ' EVENT and clk = '1' and ld = '1') then
		q <= e;
	end if;
end process;
end;