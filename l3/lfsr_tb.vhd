library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
use std.textio.all;
use ieee.std_logic_textio.all;


entity lfsr_tb is
end lfsr_tb;

architecture arch3 of lfsr_tb is

    COMPONENT lfsr2
    Port ( clk : in  STD_LOGIC;
           q : inout  STD_LOGIC_VECTOR(15 downto 0)
			);
    END COMPONENT;

    signal clk : std_logic := '0';
    signal q : STD_LOGIC_VECTOR(15 downto 0) := ('0','0','0','0', '0','0','0','0','0','0','0','0', '0','0','0','1');
    signal random_bite : STD_LOGIC_VECTOR(7 downto 0) := ('0','0','0','0', '0','0','0','1');
    signal random_bite2 : STD_LOGIC_VECTOR(7 downto 0) := ('0','0','0','0', '0','0','0','1');

    constant clk_period : time := 20 ns;

BEGIN

    uut: lfsr2 PORT MAP (
        clk => clk,
        q   => q
    );
    

    clk_process :PROCESS
    variable i : integer := 0;
    file file_handler : text open write_mode is "results.txt";
    Variable row : line;
    BEGIN
        clk <= '0';
		WAIT FOR clk_period/2;

        if (i < 8) then
            random_bite(i) <= q(15);
            i := i + 1;
        else 
            random_bite2 <= random_bite;
            write(row, random_bite2, right, 8);
            writeline(file_handler ,row);
            i := 0;
        end if;

		clk <= '1';
		WAIT FOR clk_period/2;
    END PROCESS;

END arch3;