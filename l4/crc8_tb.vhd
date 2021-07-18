LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY crc8_tb IS
END crc8_tb;

ARCHITECTURE behavior OF crc8_tb IS

    COMPONENT crc8
        PORT (
            clk : IN STD_LOGIC;
            data_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            crc_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT rom_for_crc8
        PORT (
            address : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
            data_out : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL clk : STD_LOGIC := '0';
    CONSTANT clk_period : TIME := 20 ns;

    SIGNAL data_out_a0 : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL data_out_66 : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL address : STD_LOGIC_VECTOR(2 DOWNTO 0) := ('1', '1', '1');

	SIGNAL data_in : STD_LOGIC_VECTOR(7 DOWNTO 0) := ('1', '1', OTHERS => '0');
    SIGNAL data_in_2 : STD_LOGIC_VECTOR(7 DOWNTO 0) := ('1', '1', OTHERS => '0');
    SIGNAL crc_out : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL crc_out_2 : STD_LOGIC_VECTOR(7 DOWNTO 0);

BEGIN

    uut : crc8 PORT MAP(
        clk => clk,
        data_in => data_in,
        crc_out => crc_out
    );

    uut_2 : crc8 PORT MAP(
        clk => clk,
        data_in => data_in_2,
        crc_out => crc_out_2
    );

    rom_a0 : ENTITY work.rom_for_crc8(const_a0)
        PORT MAP(
            address => address,
            data_out => data_out_a0
        );

    rom_66 : ENTITY work.rom_for_crc8(const_66)
        PORT MAP(
            address => address,
            data_out => data_out_66
        );


    clk_process : PROCESS
        VARIABLE wait_done : NATURAL := 0;
    BEGIN
        IF wait_done = 0
            THEN
            WAIT FOR clk_period * 0.2;
            wait_done := 1;
        END IF;
        clk <= '1';
        WAIT FOR clk_period/2;
        clk <= '0';
        WAIT FOR clk_period/2;
    END PROCESS;

    stim_proc : PROCESS
        VARIABLE counter : INTEGER := 0;
    BEGIN

        WAIT UNTIL (rising_edge(clk) AND clk = '1');

        address <= STD_LOGIC_VECTOR(unsigned(address) + 1);
        WAIT FOR clk_period * 0.2;
        ASSERT crc_out = data_out_a0
        REPORT "wrong crc value" SEVERITY error;
        counter := counter + 1;
        IF counter = 8 THEN
            WAIT;
        END IF;
    END PROCESS;

    stim_proc_2 : PROCESS
    VARIABLE counter2 : INTEGER := 0;
    BEGIN

        WAIT UNTIL (rising_edge(clk) AND clk = '1');

        WAIT FOR clk_period * 0.2;
        ASSERT crc_out_2 = data_out_66
        REPORT "wrong crc value" SEVERITY error;
        counter2 := counter2 + 1;
        IF counter2 = 8 THEN
            WAIT;
        END IF;
    END PROCESS;

    some_proc : PROCESS
    BEGIN
        data_in <= X"a0";
        data_in_2 <= X"66";
        WAIT;
    END PROCESS;

END;
