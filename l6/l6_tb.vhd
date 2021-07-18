LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY l6_tb IS
END l6_tb;

ARCHITECTURE behavior OF l6_tb IS

    COMPONENT sender
        PORT (
            input : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
            output : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT receiver
        PORT (
            input : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
            output : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT lossy_channel
        GENERIC (N : POSITIVE);
        PORT (
            data_in : IN STD_LOGIC_VECTOR(N - 1 DOWNTO 0);
            clk : IN STD_LOGIC;
            data_out : OUT STD_LOGIC_VECTOR(N - 1 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL inputS : STD_LOGIC_VECTOR(6 DOWNTO 0) := (OTHERS => '0');
    SIGNAL outputS : STD_LOGIC_VECTOR(11 DOWNTO 0) := (OTHERS => '0');
    SIGNAL outputR : STD_LOGIC_VECTOR(6 DOWNTO 0) := (OTHERS => '0');
    SIGNAL data_out : STD_LOGIC_VECTOR(11 DOWNTO 0) := (OTHERS => '0');
    SIGNAL clk : STD_LOGIC := '0';
    CONSTANT clk_period : TIME := 10 ns;
    CONSTANT WIDTH : INTEGER := 12;

BEGIN

    uut : sender
    PORT MAP(
        input => inputS,
        output => outputS
    );

    -- do receivera wysylany jest wynik lossy_channel
    uut2 : receiver
    PORT MAP(
        input => data_out,
        output => outputR
    );

    -- do lossy_channel wysylany jest wynik sendera
    uut3 : lossy_channel
    GENERIC MAP(N => WIDTH)
    PORT MAP(
        data_in => outputS,
        clk => clk,
        data_out => data_out
    );

    clk_process : PROCESS
    BEGIN
        clk <= '0';
        WAIT FOR clk_period/2;
        clk <= '1';
        WAIT FOR clk_period/2;
    END PROCESS;

    stim_proc : PROCESS
    BEGIN
        WAIT FOR 100 ns;

        FOR i IN 0 TO 255
            LOOP
                inputS <= STD_LOGIC_VECTOR(to_unsigned(i, inputS'length));
                WAIT FOR clk_period;
            END LOOP;
            WAIT;
        END PROCESS;

    END;