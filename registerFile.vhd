
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity registerFile is
    Port ( regFuente1 : in  STD_LOGIC_VECTOR (4 downto 0);
           regFuente2 : in  STD_LOGIC_VECTOR (4 downto 0);
			  dataWrite: in STD_LOGIC_VECTOR (31 downto 0);
			  rst : in  STD_LOGIC;
           regDestino : in  STD_LOGIC_VECTOR (4 downto 0);
			  contregFuente1: out  STD_LOGIC_VECTOR (31 downto 0);
			  contregFuente2: out  STD_LOGIC_VECTOR (31 downto 0));
		  
end registerFile;

architecture arq_registerfile of registerFile is

	type ram_type is array (0 to 39) of std_logic_vector (31 downto 0);
	signal registros : ram_type :=(others => x"00000000");

begin
process(regFuente1,regFuente2, dataWrite, rst, regDestino)
begin
	if(rst = '1')then
				contregFuente1 <= (others=>'0'); -- completa los 32 bits en cero
				contregFuente2 <= (others=>'0');
			
				registros <= (others => x"00000000");
	else
				contregFuente1 <= registros(conv_integer(regFuente1)); -- Me convierte en entero para poder buscar en la matriz
				contregFuente2 <= registros(conv_integer(regFuente2)); 
				
				if(regDestino  /= "000000")then
					registros(conv_integer(regDestino)) <= dataWrite;  
				end if;
	end if;
	
end process; 

end arq_registerfile;