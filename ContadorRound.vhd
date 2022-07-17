library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_signed.all;

entity ContadorTempo is port(
    SET15, ENABLE, CLK: in std_logic;
    CONT: out std_logic_vector(3 downto 0);
    ZERO: out std_logic
    );

end ContadorTempo;

architecture rtl of ContadorTempo is
    signal sls, teste: std_logic_vector(3 downto 0);
    
    component Registrador4_set15 is port(
    CLK, RST, ENABLE: in std_logic;
    D: in std_logic_vector(3 downto 0);
    Q: out std_logic_vector(3 downto 0)
    );
    end component;

begin
    sls <= teste - '1';
    meu_contador: Registrador8 port map (CLK, SET15, ENABLE, sls, teste);

    CONT <= teste;
    ZERO <= not(teste(0) or teste(1) or teste(2) or teste(3));
end rtl;