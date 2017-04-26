--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:52:30 04/25/2017
-- Design Name:   
-- Module Name:   D:/Users/Jehison/Documents/UTP/Sexto Semestre/Arquitectura de Computadores/Procesador/tb_pse_Modifier.vhd
-- Project Name:  Procesador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: pse_Modifier
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
 
ENTITY tb_pse_Modifier IS
END tb_pse_Modifier;
 
ARCHITECTURE behavior OF tb_pse_Modifier IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT pse_Modifier
    PORT(
         rst : IN  std_logic;
         in_crs1 : IN  std_logic_vector(31 downto 0);
         in_mux : IN  std_logic_vector(31 downto 0);
         in_aluresult : IN  std_logic_vector(31 downto 0);
         in_aluop : IN  std_logic_vector(5 downto 0);
         salida_psrm : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal in_crs1 : std_logic_vector(31 downto 0) := (others => '0');
   signal in_mux : std_logic_vector(31 downto 0) := (others => '0');
   signal in_aluresult : std_logic_vector(31 downto 0) := (others => '0');
   signal in_aluop : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal salida_psrm : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: pse_Modifier PORT MAP (
          rst => rst,
          in_crs1 => in_crs1,
          in_mux => in_mux,
          in_aluresult => in_aluresult,
          in_aluop => in_aluop,
          salida_psrm => salida_psrm
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      rst <= '1';
      -- hold reset state for 100 ns.
      wait for 100 ns;
			rst <='0';
			in_aluop<= "000101";
			in_crs1 <= x"00010000";
			in_mux <= x"00010001";
			in_aluresult <="11111111111111111111111111110011";
      wait;
   end process;

END;
