library ieee;
use ieee.std_logic_1164.all;

entity controlunit is
port(
    enter, reset, clk, end_game, end_sequence, end_round, enter_left, enter_right: in std_logic;
    R1, E1, E2, E3, E4, E5, E6: out std_logic
);
end controlunit;

architecture rtl of controlunit is

begin

end rtl;