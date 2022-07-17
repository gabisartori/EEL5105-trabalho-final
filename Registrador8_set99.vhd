library IEEE;
use IEEE.Std_Logic_1164.all;
entity Registrador8_set99 is port (
    CLK, RST, ENABLE: in std_logic;
    D: in std_logic_vector(7 downto 0);
    Q: out std_logic_vector(7 downto 0)
    );
end Registrador8_set99;

architecture Registrador8_set99ARCH of Registrador8_set99 is
    
begin 
  process(CLK,RST)
    begin
        if (RST = '1') then
            Q <= "01100011";
        elsif (CLK'event and CLK = '1' and ENABLE = '1') then
            Q <= D;
        end if;
    end process;
 
end Registrador8_set99ARCH;