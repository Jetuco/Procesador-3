----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:55:39 04/14/2017 
-- Design Name: 
-- Module Name:    conexion_procesador - arq_conexion_procesador 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity conexion_procesador is
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           resultado : out  STD_LOGIC_VECTOR (31 downto 0));
end conexion_procesador;

architecture arq_conexion_procesador of conexion_procesador is

	COMPONENT sumador
		PORT(
			operador1 : IN std_logic_vector(31 downto 0);
			operador2 : IN std_logic_vector(31 downto 0);          
			resultado_sum : OUT std_logic_vector(31 downto 0)
			);
	END COMPONENT;
	
	COMPONENT NPC
	PORT(
		direccion : IN std_logic_vector(31 downto 0);
		rst : IN std_logic;
		clk : IN std_logic;          
		salida : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT instructionMemory
	PORT(
		address : IN std_logic_vector(31 downto 0);
		rst : IN std_logic;          
		outInstruction : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT unidadControl
	PORT(
		op : IN std_logic_vector(1 downto 0);
		op3 : IN std_logic_vector(5 downto 0);          
		salida : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;
	
	COMPONENT registerFile
	PORT(
		regFuente1 : IN std_logic_vector(4 downto 0);
		regFuente2 : IN std_logic_vector(4 downto 0);
		dataWrite : IN std_logic_vector(31 downto 0);
		rst : IN std_logic;
		regDestino : IN std_logic_vector(4 downto 0);          
		contregFuente1 : OUT std_logic_vector(31 downto 0);
		contregFuente2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT Multiplexor
	PORT(
		dato_seu : IN std_logic_vector(31 downto 0);
		contrs2 : IN std_logic_vector(31 downto 0);
		i : IN std_logic;
		rst : IN std_logic;          
		salida : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT seu
	PORT(
		inmediato13bits : IN std_logic_vector(12 downto 0);
		salidaInmediato : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT alu
	PORT(
		operando1 : IN std_logic_vector(31 downto 0);
		operando2 : IN std_logic_vector(31 downto 0);
		alu_op : IN std_logic_vector(5 downto 0); 
		carry : IN std_logic; 
		salida_Alu : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT pse_Modifier
	PORT(
		rst : IN std_logic;
		in_crs1 : IN std_logic_vector(31 downto 0);
		in_mux : IN std_logic_vector(31 downto 0);
		in_aluresult : IN std_logic_vector(31 downto 0);
		in_aluop : IN std_logic_vector(5 downto 0);          
		salida_psrm : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
	COMPONENT PSR
	PORT(
		clk : IN std_logic;
		rst : IN std_logic;
		in_psrm : IN std_logic_vector(3 downto 0);          
		salida_psr_con_acarreo : OUT std_logic
		);
	END COMPONENT;
	
	signal sumadorToNPC, npcTopc, pcToInstructionmemory, InstructionmemoryToURS, resultado_alu, registerfileToalu, registerfileToMultiplexor, seuToMultiplexor, multiplexorToalu: STD_LOGIC_VECTOR (31 downto 0);
	signal aluop1: STD_LOGIC_VECTOR (5 downto 0);
	signal psrmodifierTopsr: STD_LOGIC_VECTOR (3 downto 0);
	signal psrToalu : STD_LOGIC;

begin

	Inst_sumador: sumador PORT MAP(
		operador1 => X"00000001",
		operador2 => pcToInstructionmemory,
		resultado_sum => sumadorToNPC
	);
	
	Inst_NPC: NPC PORT MAP(
		direccion => sumadorToNPC,
		rst => rst,
		clk => clk,
		salida => npcTopc
	);
	
	Inst_PC: NPC PORT MAP(
		direccion => npcTopc,
		rst => rst,
		clk => clk,
		salida => pcToInstructionmemory
	);
	
	Inst_instructionMemory: instructionMemory PORT MAP(
		address => pcToInstructionmemory,
		rst => rst,
		outInstruction => InstructionmemoryToURS
	);

	Inst_unidadControl: unidadControl PORT MAP(
		op => InstructionmemoryToURS(31 downto 30),
		op3 => InstructionmemoryToURS(24 downto 19),
		salida => aluop1
	);
	
	Inst_registerFile: registerFile PORT MAP(
		regFuente1 => InstructionmemoryToURS(18 downto 14),
		regFuente2 => InstructionmemoryToURS(4 downto 0),
		dataWrite => resultado_alu,
		rst => rst,
		regDestino => InstructionmemoryToURS(29 downto 25),
		contregFuente1 => registerfileToalu,
		contregFuente2 => registerfileToMultiplexor
	);
	
	Inst_Multiplexor: Multiplexor PORT MAP(
		dato_seu => seuToMultiplexor,
		contrs2 => registerfileToMultiplexor,
		i => InstructionmemoryToURS(13),
		rst => rst,
		salida => multiplexorToalu
	);

	Inst_seu: seu PORT MAP(
		inmediato13bits => InstructionmemoryToURS(12 downto 0),
		salidaInmediato => seuToMultiplexor
	);
	
	Inst_alu: alu PORT MAP(
		operando1 => registerfileToalu,
		operando2 => multiplexorToalu,
		alu_op => aluop1,
		carry => psrToalu,
		salida_Alu => resultado_alu
	);
	
	Inst_pse_Modifier: pse_Modifier PORT MAP(
		rst => rst,
		in_crs1 => registerfileToalu,
		in_mux => multiplexorToalu,
		in_aluresult => resultado_alu,
		in_aluop => aluop1,
		salida_psrm => psrmodifierTopsr
	);
	
	Inst_PSR: PSR PORT MAP(
		clk => clk,
		rst => rst,
		in_psrm => psrmodifierTopsr,
		salida_psr_con_acarreo => psrToalu
	);
	
	resultado <= resultado_alu;
end arq_conexion_procesador;