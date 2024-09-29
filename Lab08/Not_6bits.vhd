library ieee;
use ieee.std_logic_1164.all;

entity Not_4bits is
	port(
	addr_rom: in STD_LOGIC_VECTOR(3 downto 0);
	addr_ram: out STD_LOGIC_VECTOR(3 downto 0)
	);
end Not_4bits;

architecture main of Not_4bits is

begin

addr_ram(0) <= not(addr_rom(0));
addr_ram(1) <= not(addr_rom(1));
addr_ram(2) <= not(addr_rom(2));
addr_ram(3) <= not(addr_rom(3));

end architecture;