library IEEE;
use IEEE.Std_Logic_1164.all;
entity Registrador2 is port (
    CLK, RST, ENABLE: in std_logic;
    D: in std_logic_vector(1 downto 0);
    Q: out std_logic_vector(1 downto 0)
    );
end Registrador2;

architecture Registrador2ARCH of Registrador2 is
    
begin 
  process(CLK,RST)
    begin
        if (RST = '1') then
            Q <= "00";
        elsif (CLK'event and CLK = '1' and ENABLE = '1') then
            Q <= D;
        end if;
    end process;
 
end Registrador2ARCH;