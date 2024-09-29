LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY ROM16x4 IS
	PORT(
	clock : IN STD_LOGIC;
	rom_enable : IN STD_LOGIC;
	address : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	data_output : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
);
END ROM16x4;

ARCHITECTURE behav OF ROM16x4 IS

	TYPE rom_type IS ARRAY(0 to 15) OF STD_LOGIC_VECTOR(3 DOWNTO 0);
	CONSTANT mem: rom_type :=(
	0 => "0000",
	1 => "0001",-- Aloca um dado no endereço 1
	2 => "0010",
	3 => "0011",
	4 => "0100",
	5 => "0101",
	6 => "0110",
	7 => "0111",
	8 => "1000",
	9 => "1001",
	10 => "1010",
	11 => "1011",
	12 => "1100",
	13 => "1101",
   14 => "1110",
	15 => "1111"
	);
	
BEGIN

	PROCESS(clock) IS
	BEGIN
		IF (RISING_EDGE(clock) AND rom_enable = '1') THEN
		data_output <= mem(conv_integer(unsigned(address)));
		END IF;
	END PROCESS;
END behav;