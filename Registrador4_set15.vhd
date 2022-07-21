library IEEE;
use IEEE.Std_Logic_1164.all;
entity Registrador4_set15 is port (
    CLK, RST, ENABLE: in std_logic;
    D: in std_logic_vector(3 downto 0);
    Q: out std_logic_vector(3 downto 0)
    );
end Registrador4_set15;

architecture Registrador4_set15ARCH of Registrador4_set15 is
    
begin 
  process(CLK,RST)
    begin
        if (RST = '1') then
            Q <= "1111";
        elsif (CLK'event and CLK = '1' and ENABLE = '1') then
            Q <= D;
        end if;
    end process;
 
end Registrador4_set15ARCH;