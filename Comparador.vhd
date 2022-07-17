library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all; 
use IEEE.std_logic_unsigned.all;

entity Comparador is port (
    A,B: in std_logic_vector(7 downto 0);
    Y:  out std_logic_vector(7 downto 0)
    );
end Comparador;

architecture ComparadorArc of Comparador is
begin 

    Y <= (A xnor B);

end ComparadorArc;