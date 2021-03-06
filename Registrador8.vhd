library IEEE;
use IEEE.Std_Logic_1164.all;
entity Registrador8 is port (
    CLK, RST, ENABLE: in std_logic;
    D: in std_logic_vector(7 downto 0);
    Q: out std_logic_vector(7 downto 0)
    );
end Registrador8;

architecture Registrador8ARCH of Registrador8 is
    
begin 
  process(CLK,RST)
    begin
        if (RST = '1') then
            Q <= "00000000";
        elsif (CLK'event and CLK = '1' and ENABLE = '1') then
            Q <= D;
        end if;
    end process;
 
end Registrador8ARCH;