
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity seu is
    Port ( inmediato13bits : in  STD_LOGIC_VECTOR (12 downto 0);
           salidaInmediato : out  STD_LOGIC_VECTOR (31 downto 0));
end seu;

architecture arq_seu of seu is

begin

process(inmediato13bits)
begin
	if(inmediato13bits(12) = '1')then
			salidaInmediato(12 downto 0) <= inmediato13bits;
			salidaInmediato(31 downto 13) <= (others=>'1');
	else
			salidaInmediato(12 downto 0) <= inmediato13bits;
			salidaInmediato(31 downto 13) <= (others=>'0');
	end if;
end process; 

end arq_seu;

