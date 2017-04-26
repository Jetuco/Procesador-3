--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:20:07 04/11/2017
-- Design Name:   
-- Module Name:   D:/Users/Jehison/Documents/UTP/Sexto Semestre/Arquitectura de Computadores/Procesador/tb_registerfile.vhd
-- Project Name:  Procesador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: registerFile
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
 
ENTITY tb_registerfile IS
END tb_registerfile;
 
ARCHITECTURE behavior OF tb_registerfile IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT registerFile
    PORT(
         regFuente1 : IN  std_logic_vector(4 downto 0);
         regFuente2 : IN  std_logic_vector(4 downto 0);
         dataWrite : IN  std_logic_vector(31 downto 0);
         rst : IN  std_logic;
         regDestino : IN  std_logic_vector(4 downto 0);
         contregFuente1 : OUT  std_logic_vector(31 downto 0);
         contregFuente2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal regFuente1 : std_logic_vector(4 downto 0) := (others => '0');
   signal regFuente2 : std_logic_vector(4 downto 0) := (others => '0');
   signal dataWrite : std_logic_vector(31 downto 0) := (others => '0');
   signal rst : std_logic := '0';
   signal regDestino : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal contregFuente1 : std_logic_vector(31 downto 0);
   signal contregFuente2 : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: registerFile PORT MAP (
          regFuente1 => regFuente1,				--5
          regFuente2 => regFuente2,				--5
          dataWrite => dataWrite,				--32
          rst => rst,							--1
          regDestino => regDestino,				--4
          contregFuente1 => contregFuente1,	--31
          contregFuente2 => contregFuente2	--31
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
		rst <= '1';
      wait for 100 ns;	
		rst <= '0';
		regFuente1<="10000";
		regFuente2<="10010";
		dataWrite<=X"00000011";
   end process;

END;
