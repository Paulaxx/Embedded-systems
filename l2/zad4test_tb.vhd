library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity zad4test_tb is
END zad4test_tb;

ARCHITECTURE zad4_tb OF zad4test_tb IS 

    COMPONENT zad4test
    PORT(
        a,b,c : in std_logic;
        x : out std_logic
        );
    END COMPONENT;

    signal a : std_logic := '0';
    signal b : std_logic := '0';
    signal c : std_logic := '0';

    signal abc : std_logic_vector(2 downto 0) := (others => '0');
    signal x : std_logic;
    constant period : time := 10 ns;

begin
    UUT : zad4test generic map (width => 12)
    port map ( a => a, b => b, c => c, x => x );

    stim_proc: process
    begin

END;