library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_signed.all;

entity ContadorRound is port(
    SET15, ENABLE, CLK: in std_logic;
    CONT: out std_logic_vector(3 downto 0);
    ZERO: out std_logic
);

end ContadorRound;

architecture rtl of ContadorRound is
    signal prox, atual: std_logic_vector(3 downto 0);
    
    component Registrador4_set15 is port(
    CLK, RST, ENABLE: in std_logic;
    D: in std_logic_vector(3 downto 0);
    Q: out std_logic_vector(3 downto 0)
    );
    end component;

begin
    prox <= atual - '1';
    meu_contador: Registrador4_set15 port map (CLK, SET15, ENABLE, prox, atual);

    CONT <= atual;
    ZERO <= not(atual(0) or atual(1) or atual(2) or atual(3));
end rtl;