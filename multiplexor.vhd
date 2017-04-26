
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplexor is
    Port ( dato_seu : in  STD_LOGIC_VECTOR (31 downto 0);
           contrs2 : in  STD_LOGIC_VECTOR (31 downto 0);
           i : in  STD_LOGIC;
			  rst : in  STD_LOGIC;
           salida : out  STD_LOGIC_VECTOR (31 downto 0));
end Multiplexor;

architecture arq_Multiplexor of Multiplexor is

begin
	process(i,dato_seu,contrs2)
	begin
		if(i='1')then
			salida<= dato_seu;
		else 
			if(i='0')then
				salida <= contrs2;
			end if ; 
		end if; 	
	end process; 

end arq_Multiplexor;