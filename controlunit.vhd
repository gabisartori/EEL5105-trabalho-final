library ieee;
use ieee.std_logic_1164.all;

entity controlunit is
port(
    enter, reset, clk, end_game, end_sequence, end_round, enter_left, enter_right: in std_logic;
    R1, E1, E2, E3, E4, E5, E6: out std_logic
);
end controlunit;

architecture rtl of usertop is
    type ESTADOS is (INIT, SETUP, SEQUENCE, PLAY, CHECK, ESPERAR, RESULT);
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
                R1 <= 1;
                E1 <= 0;
                E2 <= 0;
                E3 <= 0;
                E4 <= 0;
                E5 <= 0;
                E6 <= 0;
                PROXIMO_ESTADO <= SETUP;
            when SETUP =>
                R1 <= 0;
                E1 <= 0;
                E2 <= 0;
                E3 <= 0;
                E4 <= 0;
                E5 <= 0;
                E6 <= 0;
                PROXIMO_ESTADO <= ;
            when SEQUENCE =>
                R1 <= 0;
                E1 <= 0;
                E2 <= 0;
                E3 <= 0;
                E4 <= 0;
                E5 <= 0;
                E6 <= 0;
                PROXIMO_ESTADO <= ;
            when PLAY =>
                R1 <= 0;
                E1 <= 0;
                E2 <= 0;
                E3 <= 0;
                E4 <= 0;
                E5 <= 0;
                E6 <= 0;
                PROXIMO_ESTADO <= ;
            when CHECK =>
                R1 <= 0;
                E1 <= 0;
                E2 <= 0;
                E3 <= 0;
                E4 <= 0;
                E5 <= 0;
                E6 <= 0;
                PROXIMO_ESTADO <= ;
            when ESPERAR =>
                R1 <= 0;
                E1 <= 0;
                E2 <= 0;
                E3 <= 0;
                E4 <= 0;
                E5 <= 0;
                E6 <= 0;
                PROXIMO_ESTADO <= ;
            when RESULT =>
                R1 <= 0;
                E1 <= 0;
                E2 <= 0;
                E3 <= 0;
                E4 <= 0;
                E5 <= 0;
                E6 <= 0;
                PROXIMO_ESTADO <= ;
        end case;
    end process;
end rtl;