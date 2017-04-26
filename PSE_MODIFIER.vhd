
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity pse_Modifier is
    Port ( rst : in STD_LOGIC;
			  in_crs1 : in  STD_LOGIC_VECTOR (31 downto 0);
           in_mux : in  STD_LOGIC_VECTOR (31 downto 0);
           in_aluresult : in  STD_LOGIC_VECTOR (31 downto 0);
           in_aluop : in  STD_LOGIC_VECTOR (5 downto 0);
           salida_psrm : out  STD_LOGIC_VECTOR (3 downto 0));
end pse_Modifier;

architecture arq_pse_Modifier of pse_Modifier is

begin
	
	process (rst, in_aluop, in_aluresult, in_crs1, in_mux)
		begin
			if rst = '1' then 
				salida_psrm <= "0000";
			else
				-- Operadores logicos que modifican el ICC "ANDcc or ANDNcc or ORcc or ORNcc or XORcc or XNORcc"
				--				   ANDcc							ANDNcc					  ORcc						 NORcc
				if in_aluop = "001000" or in_aluop = "001010" or in_aluop = "001100" or in_aluop = "001110" or in_aluop = "010000" or in_aluop = "010010" then 
					salida_psrm(3) <= in_aluresult(31); -- El signo que traiga.
					if in_aluresult = "00000000000000000000000000000000" then 
						salida_psrm(2) <= '1'; -- Porque el resultado da cero.
					else
						salida_psrm(2) <= '0';
					end if;
					salida_psrm(1) <= '0'; -- Los operadores logicos no generan overflow ni carry
					salida_psrm(0) <= '0';
				end if;
				
				-- ADDcc or ADDxcc
				if in_aluop = "000010" or in_aluop = "000011" then
					salida_psrm(3) <= in_aluresult(31);
					if in_aluresult = "00000000000000000000000000000000" then 
						salida_psrm(2) <= '1';
					else
						salida_psrm(2) <= '0';
					end if;
					salida_psrm(1) <= (in_crs1(31) and in_mux(31) and (not in_aluresult(31))) or ((not in_crs1(31)) and (not in_mux(31)) and in_aluresult(31));
					salida_psrm(0) <= (in_crs1(31) and in_mux(31)) or ((not in_aluresult(31)) and (in_crs1(31) or in_mux(31)));
				end if;
				
				--SUBcc or SUBxcc
				if in_aluop = "000101" or in_aluop = "000110" then
					salida_psrm(3) <= in_aluresult(31);
					if in_aluresult = "00000000000000000000000000000000" then 
						salida_psrm(2) <= '1';
					else
						salida_psrm(2) <= '0';
					end if;
					salida_psrm(1) <= (in_crs1(31) and (not in_mux(31)) and (not in_aluresult(31))) or ((not in_crs1(31)) and in_mux(31) and in_aluresult(31));
					salida_psrm(0) <= ((not in_crs1(31)) and in_mux(31)) or (in_aluresult(31) and ((not in_crs1(31)) or in_mux(31)));
				end if;
				
			end if;
end process;

end arq_pse_Modifier;

