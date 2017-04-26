
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity PSR is
    Port ( clk : in  STD_LOGIC;
			  rst : in STD_LOGIC;
           in_psrm : in  STD_LOGIC_VECTOR (3 downto 0);
           salida_psr_con_acarreo : out  STD_LOGIC);
end PSR;

architecture arq_PSR of PSR is

begin
	
	process(rst, clk, in_psrm)
		begin
		
			if (rst = '1') then 		
				 salida_psr_con_acarreo <= '0';
			elsif (rising_edge(clk)) then
				salida_psr_con_acarreo <= in_psrm(0);
				
			end if;
	end process;

end arq_PSR;

