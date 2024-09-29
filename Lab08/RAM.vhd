LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

entity RAM is
	port(
		RAM_address: in STD_LOGIC_VECTOR(3 downto 0);
		RAM_rw: in STD_LOGIC;
		RAM_input : in STD_LOGIC_VECTOR(3 DOWNTO 0);
		RAM_output : out STD_LOGIC_VECTOR(3 DOWNTO 0);
		RAM_en, clk: in STD_LOGIC
	);
end;

architecture main of RAM is

TYPE ram_type IS ARRAY(0 to 15) OF STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL ram: ram_type;
SIGNAL temp_address: STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN

PROCESS(clk) IS
	begin
		if ( clk='1' AND RAM_en = '1') then
			IF (RAM_rw = '0') THEN
				temp_address <= RAM_address;
			ELSIF (RAM_rw = '1') THEN
				ram(conv_integer(unsigned(RAM_address))) <= RAM_input;
			END IF;
			RAM_output <= ram(conv_integer(unsigned(temp_address)));
		END IF;
	END PROCESS;

end architecture;