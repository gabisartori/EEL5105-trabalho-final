library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all; 
use IEEE.std_logic_unsigned.all;

entity Comparador is port (
    A,B: in std_logic_vector(7 downto 0);
    Y:  out std_logic
    );
end Comparador;

architecture ComparadorArc of Comparador is
Signal all_bits: std_logic_vector(7 downto 0);
    begin 

    all_bits <= (A xnor B);
    Y <= all_bits(0) and all_bits(1) and all_bits(2) and all_bits(3) and all_bits(4) and all_bits(5) and all_bits(6) and all_bits(7);
    

end ComparadorArc;