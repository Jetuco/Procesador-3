--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:12:27 04/25/2017
-- Design Name:   
-- Module Name:   D:/Users/Jehison/Documents/UTP/Sexto Semestre/Arquitectura de Computadores/Procesador/tb_PSR.vhd
-- Project Name:  Procesador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PSR
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
 
ENTITY tb_PSR IS
END tb_PSR;
 
ARCHITECTURE behavior OF tb_PSR IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PSR
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         in_psrm : IN  std_logic_vector(3 downto 0);
         salida_psr_con_acarreo : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal in_psrm : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal salida_psr_con_acarreo : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PSR PORT MAP (
          clk => clk,
          rst => rst,
          in_psrm => in_psrm,
          salida_psr_con_acarreo => salida_psr_con_acarreo
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin	
	
      rst<='1';
      -- hold reset state for 100 ns.
      wait for 100 ns;
		rst<='0';
		in_psrm <= "1111";

      wait;
   end process;

END;
