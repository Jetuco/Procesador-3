
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL; --Para poder usar signo matematicos


entity sumador is
    Port ( operador1 : in  STD_LOGIC_VECTOR (31 downto 0);
           operador2 : in  STD_LOGIC_VECTOR (31 downto 0);
           resultado_sum : out  STD_LOGIC_VECTOR (31 downto 0));
end sumador;

architecture arq_sumador of sumador is

begin

	process(operador1,operador2)
	
	begin
		resultado_sum <= operador1 + operador2;
	end process;

end arq_sumador;

