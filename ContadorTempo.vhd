library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_signed.all;

entity ContadorTempo is port(
    SET99, ENABLE, CLK: in std_logic;
    STEP: in std_logic_vector(7 downto 0);
    CONT: out std_logic_vector(7 downto 0);
    NEG: out std_logic
    );

end ContadorTempo;

architecture rtl of ContadorTempo is
    signal sls, teste: std_logic_vector(7 downto 0);
    
    component Registrador8 is port (
    CLK, RST, ENABLE: in std_logic;
    D: in std_logic_vector(7 downto 0);
    Q: out std_logic_vector(7 downto 0)
    );
    end component;

begin
    
    sls <= teste + STEP;

    meu_contador: Registrador8 port map (CLK, SET99, ENABLE, sls, teste);

    CONT <= teste;
end rtl;