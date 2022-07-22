library ieee;
use ieee.std_logic_1164.all;

entity controlunit is
port(
    enter, reset, clk, end_game, end_sequence, end_round, enter_left, enter_right: in std_logic;
    R1, E1, E2, E3, E4, E5, E6: out std_logic
);
end controlunit;

architecture rtl of controlunit is
    type ESTADOS is (INIT, SETUP, SEQUENCE, PLAY, CHECK, ESPERAR, RESULT);
    signal ESTADO, PROXIMO_ESTADO: ESTADOS;
begin
    process(clk, RESET)
    begin
        if (reset = '1') then
            ESTADO <= INIT;
        elsif (clk'event and clk = '1') then
            ESTADO <= PROXIMO_ESTADO;
        end if;
    end process;
    
    process(clk, ESTADO)
    begin
        case ESTADO is
            when INIT =>
                R1 <= '1';
                E1 <= '0';
                E2 <= '0';
                E3 <= '0';
                E4 <= '0';
                E5 <= '0';
                E6 <= '0';
                PROXIMO_ESTADO <= SETUP;
            when SETUP =>
                R1 <= '0';
                E1 <= '1';
                E2 <= '0';
                E3 <= '0';
                E4 <= '0';
                E5 <= '0';
                E6 <= '0';
                if (enter = '1') then
                    PROXIMO_ESTADO <= SEQUENCE;
                else
                    PROXIMO_ESTADO <= SETUP;
                end if;
            when SEQUENCE =>
                R1 <= '0';
                E1 <= '0';
                E2 <= '1';
                E3 <= '0';
                E4 <= '0';
                E5 <= '0';
                E6 <= '0';
                if (end_sequence = '1') then
                    PROXIMO_ESTADO <= PLAY;
                else
                    PROXIMO_ESTADO <= SEQUENCE;
                end if;
            when PLAY =>
                R1 <= '0';
                E1 <= '0';
                E2 <= '0';
                E3 <= '1';
                E4 <= '0';
                E5 <= '0';
                E6 <= '0';
                if (enter_left = '1' and enter_right = '1') then
                    PROXIMO_ESTADO <= CHECK;
                else
                    PROXIMO_ESTADO <= PLAY;
                end if;
            when CHECK =>
                R1 <= '0';
                E1 <= '0';
                E2 <= '0';
                E3 <= '0';
                E4 <= '1';
                E5 <= '0';
                E6 <= '0';
                PROXIMO_ESTADO <= ESPERAR;
            when ESPERAR =>
                R1 <= '0';
                E1 <= '0';
                E2 <= '0';
                E3 <= '0';
                E4 <= '0';
                E5 <= '1';
                E6 <= '0';
                if (end_round = '1' or end_game = '1') then
                    PROXIMO_ESTADO <= RESULT;
                elsif (enter_left = '1' or enter_right = '1') then
                    PROXIMO_ESTADO <= SEQUENCE;
                else
                    PROXIMO_ESTADO <= ESPERAR;
                end if;
            when RESULT =>
                R1 <= '0';
                E1 <= '0';
                E2 <= '0';
                E3 <= '0';
                E4 <= '0';
                E5 <= '0';
                E6 <= '1';
                if (enter = '1') then
                    PROXIMO_ESTADO <= SETUP;
                else
                    PROXIMO_ESTADO <= RESULT;
                end if;
        end case;
    end process;
end rtl;