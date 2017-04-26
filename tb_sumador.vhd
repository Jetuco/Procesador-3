--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:20:26 04/11/2017
-- Design Name:   
-- Module Name:   D:/Users/Jehison/Documents/UTP/Sexto Semestre/Arquitectura de Computadores/Procesador/tb_sumador.vhd
-- Project Name:  Procesador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: sumador
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
 
ENTITY tb_sumador IS
END tb_sumador;
 
ARCHITECTURE behavior OF tb_sumador IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sumador
    PORT(
         operador1 : IN  std_logic_vector(31 downto 0);
         operador2 : IN  std_logic_vector(31 downto 0);
         resultado_sum : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal operador1 : std_logic_vector(31 downto 0) := (others => '0');
   signal operador2 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal resultado_sum : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sumador PORT MAP (
          operador1 => operador1,
          operador2 => operador2,
          resultado_sum => resultado_sum
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
		operador1<="00000000000000000000000000111111";
		operador2<="00000000000000000000000001001001";
      wait for 100 ns;
   end process;

END;
