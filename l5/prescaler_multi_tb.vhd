LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

ENTITY prescaler_multi_tb IS
END prescaler_multi_tb;

ARCHITECTURE behavior OF prescaler_multi_tb IS 

	COMPONENT prescaler_multi
	PORT(
		clk : IN std_logic;
		clkout: OUT std_logic_vector(0 to 7)
	);
	END COMPONENT;

    signal clk : std_logic := '0';
    constant clk_period : time := 8 ns;
	signal clkout: std_logic_vector(0 to 7);

BEGIN
    uut: prescaler_multi PORT MAP (
       clk => clk,
       clkout => clkout
    );

    clk_process : process
        variable wait_done : natural := 0;
    begin
        if wait_done = 0 then
            wait for 100 ns;
            wait_done := 1;
        end if;
            clk <= '1';
            wait for clk_period/2;
            clk <= '0';
            wait for clk_period/2;
    end process;
END;
