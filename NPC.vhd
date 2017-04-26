
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity NPC is
    Port ( direccion : in  STD_LOGIC_VECTOR (31 downto 0);
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           salida : out  STD_LOGIC_VECTOR (31 downto 0));
end NPC;

architecture arq_NPC of NPC is

begin

	process(clk,rst,direccion)
		begin 
			if(rising_edge(clk))then 
				if(rst='1')then
					 salida <= (others =>'0');
				 else 
					salida <= direccion; 
			end if;
		end if;
	end process;

end arq_NPC;

