
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity unidadControl is
    Port ( op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           salida : out  STD_LOGIC_VECTOR (5 downto 0));
end unidadControl;

architecture arq_unidadControl of unidadControl is

begin
process(op,op3)
begin
if (op= "10")then
			case op3 is 
				
							when "000000" => -- ADD
								salida  <= "000001";
								
							when "010000" => -- ADDcc "Add and modify ICC"
								salida  <= "000010";
								
							when "011000" => -- ADDXcc "Add with carry and modify ICC"
								salida  <= "000011";
								
							when "000100" => -- SUB
								 salida <= "000100";
							
							when "010100" => -- SUBcc "Substract and modify ICC"
								salida  <= "000101";
							
							when "011100" => -- SUBXcc "Substract with carry and modify ICC"
								salida  <= "000110";
								 
							when "000001" => -- AND
								salida <= "000111";
								
							when "010001" => -- ANDcc "AND and modify ICC"
								salida <= "001000";
								 
							when "000101" => -- ANDN
								salida <= "001001";
							
							when "010101" => -- ANDNcc "AND NOT and modify ICC"
								salida <= "001010";
								 
							when "000010" => -- OR
								salida <= "001011";
								
							when "010010" => -- ORcc "INCLUSIVE OR and modify ICC"
								salida <= "001100"; --
								
							when "000110" => -- ORN
								salida <= "001101";
								
							when "010110" => -- ORNcc "INCLUSIVE OR NOT and modify ICC"
								salida <= "001110";
							
							when "000011" => -- XOR
								salida <= "001111"; 
								
							when "010011" => -- XORcc	"EXCLUSIVE OR and modify ICC"
								salida <= "010000"; 
							
							when "000111" => -- XORN
								salida <= "010001";
							
							when "010111" => -- XORNcc	"EXCLUSIVE NOR and modify ICC"
								salida <= "010010";
							when others => -- Implementar demas instrucciones
								salida <= "111111"; 

						end case;
						 
		end if; 

end process; 
end arq_unidadControl;