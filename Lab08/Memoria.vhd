LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

entity Memoria is
	port(
		address_Memoria: in STD_LOGIC_VECTOR(3 downto 0);
		clock_memory : IN STD_LOGIC;
		rom_enable : IN STD_LOGIC;
		ram_enable : in std_logic;
		data_RAM_output : OUT STD_LOGIC_VECTOR(3 DOWNTO 0); -- Saida do circuito vai ser a saída da RAM
		ld_memory: in STD_LOGIC;
		rw_memory: in STD_LOGIC
		);
end;

architecture main of Memoria is

component ROM16x4 is
	PORT(
	clock : IN STD_LOGIC;
	rom_enable : IN STD_LOGIC;
	address : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	data_output : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
);
END component;

component RAM is
	port(
		RAM_address: in STD_LOGIC_VECTOR(3 downto 0);
		RAM_rw: in STD_LOGIC;
		RAM_input : in STD_LOGIC_VECTOR(3 DOWNTO 0);
		RAM_output : out STD_LOGIC_VECTOR(3 DOWNTO 0);
		RAM_en, clk: in STD_LOGIC
	);
end component;

component Not_4bits is
	port(
	addr_rom: in STD_LOGIC_VECTOR(3 downto 0);
	addr_ram: out STD_LOGIC_VECTOR(3 downto 0)
	);
end component;

component regist_4Bits is
	port(
		e: in STD_LOGIC_VECTOR(3 DOWNTO 0);
		clk, ld : in STD_LOGIC;
		q: out STD_LOGIC_VECTOR(3 DOWNTO 0)
		);
end component;

SIGNAL temp_address: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL Not_to_RAM_address: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL ROM_to_Register: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL Register_to_RAM: STD_LOGIC_VECTOR(3 DOWNTO 0);

begin

PortROM: ROM16x4 port map(clock => clock_memory, address => address_Memoria, rom_enable => rom_enable, data_output => 
ROM_to_Register );

PortRegister: regist_4Bits port map(e => ROM_to_Register, q => Register_to_RAM, clk => clock_memory, ld => ld_memory);

PortNot: Not_4bits port map( addr_rom(0) => address_Memoria(0), addr_rom(1) => address_Memoria(1), addr_rom(2) => address_Memoria(2), 
							addr_rom(3) => address_Memoria(3), addr_ram(0) => Not_to_RAM_address(0), 
							addr_ram(1) => Not_to_RAM_address(1), addr_ram(2) => Not_to_RAM_address(2), addr_ram(3) => Not_to_RAM_address(3));

PortRAM: RAM port map(RAM_address => Not_to_RAM_address, RAM_input => Register_to_RAM, RAM_output => data_RAM_output, RAM_rw => rw_memory, 
						RAM_en => ram_enable, clk => clock_memory);

end architecture;