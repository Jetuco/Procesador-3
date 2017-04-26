
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity alu is
    Port ( operando1 : in  STD_LOGIC_VECTOR (31 downto 0);
           operando2 : in  STD_LOGIC_VECTOR (31 downto 0);
			  alu_op:  in  STD_LOGIC_VECTOR (5 downto 0); 
			  carry : in STD_LOGIC;
           salida_Alu : out  STD_LOGIC_VECTOR (31 downto 0));
end alu;

architecture arq_Alu of alu is

begin
process(operando1, operando2, alu_op)
begin
 case (alu_op) is 
			when "000001" => -- ADD	"simple add"
				salida_Alu <= operando1 + operando2;
				
			when "000010" => -- ADDcc	"add with ICC"
				salida_Alu <= operando1 + operando2;
				
			when "000011" => -- ADDXcc	"add and modify ICC and ICC"
				salida_Alu <= operando1 + operando2 + carry; -- Operandos mas el bit que llevo
				
			when "000100" => -- SUB		"simple subtract"
				salida_Alu <= operando1 - operando2;
				
			when "000101" => -- SUBcc		"subtract with ICC"
				salida_Alu <= operando1 - operando2;
				
			when "000110" => -- SUBXcc		"subtract and modify ICC and ICC"
				salida_Alu <= operando1 - operando2 - carry;
				
			when "000111" => --AND		"Simple AND"
				salida_Alu <= operando1 and operando2;
				
			when "001000" => --ANDcc		"AND and modify ICC"
				salida_Alu <= operando1 and operando2;
				
			when "001001" => --ANDN		"Simple AND NOT"
				salida_Alu <= operando1 nand operando2;
				
			when "001010" => --ANDNcc		"AND NOT and modify ICC"
				salida_Alu <= operando1 nand operando2;
				
			when "001011" => --OR		"Simple INCLUSIVE OR"
				salida_Alu <= operando1 or operando2;
				
			when "001100" => --ORcc		"INCLUSIVE OR and modify ICC"
				salida_Alu <= operando1 or operando2;
				
			when "001101" => -- ORN		"simple INCLUSIVE OR NOT "
				salida_Alu <= operando1 nor operando2;
				
			when "001110" => -- ORNcc	"INCLUSIVE OR NOT and modify ICC"
				salida_Alu <= operando1 nor operando2;
				
			when "001111" => -- XOR		"Simple EXCLUSIVE OR"
				salida_Alu <= operando1 xor operando2;
				
			when "010000" => -- XORcc	"EXCLUSIVE OR and modify ICC"
				salida_Alu <= operando1 xor operando2;
				
			when "010001" => -- XORN	"Simple EXCLUSIVE NOR"
				salida_Alu <= operando1 xnor operando2;
				
			when "010010" => -- XORNcc "EXCLUSIVE NOR and modify ICC"
				salida_Alu <= operando1 xnor operando2;
				
			when others => -- Lega al NOP
				salida_Alu <= (others=>'0');
		end case;
	end process; 

end arq_Alu;