library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_signed.all;

entity ContadorSeq is port(
    RESET, ENABLE, CLK: in std_logic;
    CONT: out std_logic_vector(1 downto 0);
    FOUR: out std_logic
    );

end ContadorSeq;

architecture rtl of ContadorSeq is
    signal prox, atual: std_logic_vector(3 downto 0);
    signal flag: std_logic;
    signal atual_8bits: std_logic_vector(7 downto 0);

    component Comparador is port(
        A,B: in std_logic_vector(7 downto 0);
        Y:  out std_logic
    );
    end component;

    component Registrador4 is port(
    CLK, RST, ENABLE: in std_logic;
    D: in std_logic_vector(3 downto 0);
    Q: out std_logic_vector(3 downto 0)
    );
    end component;

begin
    prox <= atual + '1';
    atual_8bits <= "0000" & atual;
    meu_contador: Registrador4 port map (CLK, RESET, ENABLE, prox, atual);
    meu_comparador: Comparador port map (atual_8bits, "00000100", FOUR);

    CONT <= atual(1 downto 0);
end rtl;