library ieee;
use ieee.std_logic_1164.all;

entity controlunit is
port(
    enter, reset, clk, end_game, end_sequence, end_round, enter_left, enter_right: in std_logic;
    R1, E1, E2, E3, E4, E5, E6: out std_logic
);
end controlunit;

architecture rtl of usertop is
    type ESTADOS is ();
    signal ESTADO, PROXIMO_ESTADO: ESTADOS;
begin
    process(CLOCK, RESET)
    begin
        if (reset = '1') then
            ESTADO <= INIT;
        elsif (CLOCK'event and CLOCK = '1') then
            ESTADO <= PROXIMO_ESTADO;
        end if;
    end process;
    
    process(CLOCK, ESTADO)
    begin
        case ESTADO is
            when INIT =>
                S <= "11";
                if (B = '1') then
                    PROXIMO_ESTADO <= ON1;
                else
                    PROXIMO_ESTADO <= INIT;
                end if;
            when ON1 =>
                S <= "01";
                PROXIMO_ESTADO <= OFF1;           
        end case;
    end process;
end rtl;