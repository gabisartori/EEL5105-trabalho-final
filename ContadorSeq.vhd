library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_signed.all

entity ContadorSeq is port(
    CLK: in std_logic;
    SET: in std_logic;
    E: in std_logic;
    Y: out std_logic_vector(7 downto 0)
    );

end ContadorSeq;

architecture rtl of ContadorSeq is
    signal Q, QP: std_logic_vector(4 downto 0);
    
    component REG4 is port (
    CLK, RST: in std_logic;
    D: in std_logic_vector(3 downto 0);
    Q: out std_logic_vector(3 downto 0)
    );
    end component;
begin
    E <= E4 or (not Enter_left and  E3 and CLK) 

end rtl;