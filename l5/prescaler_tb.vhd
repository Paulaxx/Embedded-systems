LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

ENTITY prescaler_tb IS
END prescaler_tb;

ARCHITECTURE behavior OF prescaler_tb IS 
    COMPONENT clock1
    PORT(
        clk : IN std_logic;
        clka : OUT std_logic
    );
    END COMPONENT;

    COMPONENT clock2
    PORT(
        clk : IN std_logic;
        clkb : OUT std_logic
    );
    END COMPONENT;

    COMPONENT clock3
    PORT(
        clk : IN std_logic;
        clkc : OUT std_logic
    );
    END COMPONENT;

    signal clk : std_logic := '0';
    constant clk_period : time := 8 ns;
	signal clka : std_logic;
	signal clkb : std_logic;
	signal clkc : std_logic;

begin
    uut1: clock1 PORT MAP (
        clk => clk,
        clka => clka
    );
    uut2: clock2 PORT MAP (
        clk => clk,
        clkb => clkb
    );
    uut3: clock3 PORT MAP (
        clk => clk,
        clkc => clkc
    );

    clk_process :process
		variable wait_done : natural := 0;
    begin
        if wait_done = 0
            then
            wait for 100 ns;
            wait_done := 1;
        end if;
            clk <= '1';
            wait for clk_period/2;
            clk <= '0';
            wait for clk_period/2;
    end process;
end;