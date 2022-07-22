library ieee;
use ieee.std_logic_1164.all;

entity usertest is
end usertest;

architecture tb of usertest is

    -- Signal declarations:
    signal mkey: std_logic_vector(3 downto 0) := "1111";
    signal msw: std_logic_vector(17 downto 0) := "000000000000000000";
    signal mledr: std_logic_vector(17 downto 0) := "000000000000000000";
    signal mHEX0, mHEX1, mHEX2, mHEX3, mHEX4, mHEX5, mHEX6, mHEX7	: std_logic_vector(6 downto 0);
    signal mclk: std_logic := '0';
    
    -- Component declarations:
    component usertop is port(
        KEY: in std_logic_vector(3 downto 0);
        SW: in std_logic_vector(17 downto 0);
        LEDR: out std_logic_vector(17 downto 0);
        HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6,HEX7	: out std_logic_vector(6 downto 0);
        CLK: in std_logic
    );
    end component;
begin
    -- Component instantiation and port map:
    
    DUT: usertop port map(
        KEY => mkey,
        SW => msw,
        LEDR => mledr,
        HEX0 => mHEX0,
        HEX1 => mHEX1,
        HEX2 => mHEX2,
        HEX3 => mHEX3,
        HEX4 => mHEX4,
        HEX5 => mHEX5,
        HEX6 => mHEX6,
        HEX7 => mHEX7,
        CLK => mclk
    );
    
    -- Stimuli:
    mclk <= not mclk after 5 ns;
    mkey(0) <= '1', '0' after 5 ns, '1' after 15 ns;
    msw(1) <= '0', '1' after 30 ns, '0' after 40 ns;
    
end tb;