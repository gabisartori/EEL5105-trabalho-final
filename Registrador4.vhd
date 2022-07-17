library IEEE;
use IEEE.Std_Logic_1164.all;
entity Registrador4 is port (
    CLK, RST, ENABLE: in std_logic;
    valor_proximo: in std_logic_vector(3 downto 0);
    valor: out std_logic_vector(3 downto 0)
    );
end Registrador4;

architecture Registrador4ARCH of Registrador4 is
    
begin 
  process(CLK,RST)
    begin
        if (RST = '1') then
            valor <= "0000";
        elsif (CLK'event and CLK = '1' and ENABLE = '1') then
            valor <= valor_proximo;
        end if;
    end process;
 
end Registrador4ARCH;