library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use std.textio.all;


entity instructionMemory is
    Port ( 
			  address : in  STD_LOGIC_VECTOR (31 downto 0);
           rst : in  STD_LOGIC;
           outInstruction : out  STD_LOGIC_VECTOR (31 downto 0));
end instructionMemory;

architecture arqInstructionMemory of instructionMemory is

	type rom_type is array (0 to 2) of std_logic_vector (31 downto 0);  --crea una matriz 5*32
		
	impure function InitRomFromFile (RomFileName : in string) return rom_type is
		FILE RomFile : text open read_mode is RomFileName;
		variable RomFileLine : line;							--almacena la linea con las direcciones
		variable temp_bv : bit_vector(31 downto 0);		--almacena todos los bits
		variable temp_mem : rom_type;							--almacena los bits en un vector
		begin
			for I in rom_type'range loop
				readline (RomFile, RomFileLine);				--lee cada linea del archivo
				read(RomFileLine, temp_bv);					--almacena los bits 
				temp_mem(i) := to_stdlogicvector(temp_bv);
			end loop;
		return temp_mem;
	end function;
	
	signal instructions : rom_type := InitRomFromFile("instruction.data");
	
begin
	process(rst,address, instructions)
	begin
			if(rst = '1')then
				outInstruction <= (others=>'0');
			else
				outInstruction <= instructions(conv_integer(address(4 downto 0)));
			end if;
	end process;
end arqInstructionMemory;
