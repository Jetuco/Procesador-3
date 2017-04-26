--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:18:24 04/11/2017
-- Design Name:   
-- Module Name:   D:/Users/Jehison/Documents/UTP/Sexto Semestre/Arquitectura de Computadores/Procesador/tb_Multiplexor.vhd
-- Project Name:  Procesador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Multiplexor
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_Multiplexor IS
END tb_Multiplexor;
 
ARCHITECTURE behavior OF tb_Multiplexor IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Multiplexor
    PORT(
         dato_seu : IN  std_logic_vector(31 downto 0);
         contrs2 : IN  std_logic_vector(31 downto 0);
         rst: IN  std_logic;
			i : IN  std_logic;
         salida : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal dato_seu : std_logic_vector(31 downto 0) := (others => '0');
   signal contrs2 : std_logic_vector(31 downto 0) := (others => '0');
   signal i : std_logic := '0';

 	--Outputs
   signal salida : std_logic_vector(31 downto 0);
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Multiplexor PORT MAP (
          dato_seu => dato_seu,
          contrs2 => contrs2,
          i => i,
			 rst=>rst,
          salida => salida
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
		i<='1';
      wait for 100 ns;	
		i<='0';
		dato_seu <= X"00000001";
		contrs2 <= X"00000010";	
   end process;

END;
