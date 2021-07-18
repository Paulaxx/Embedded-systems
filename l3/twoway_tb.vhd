library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity twoway_tb is
end twoway_tb;

architecture arch2 of twoway_tb is

    COMPONENT twoway
    GENERIC (NBit : positive := 4);
    PORT ( clk : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (NBit-1 downto 0) := (OTHERS => '0')
		);
    END COMPONENT;

    signal clk : std_logic := '0';
    signal q : STD_LOGIC_VECTOR (4-1 downto 0) := (OTHERS => '0');

    constant clk_period : time := 20 ns;

BEGIN

    uut: twoway PORT MAP (
        clk => clk,
        q   => q
    );

    clk_process :PROCESS
    BEGIN
		clk <= '0';
		WAIT FOR clk_period/2;
		clk <= '1';
		WAIT FOR clk_period/2;
    END PROCESS;

END arch2;