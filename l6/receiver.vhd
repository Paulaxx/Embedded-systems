LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY receiver IS
    PORT (
        input : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
        output : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
    );
END receiver;

ARCHITECTURE behavioral_receiver OF receiver IS
    SIGNAL tmp : STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');
    SIGNAL tmp0 : STD_LOGIC := '0';
    SIGNAL errors2 : STD_LOGIC := '0';
BEGIN

    tmp(0) <= input(3) XOR input(5) XOR input(7) XOR input(9) XOR input(11) XOR input(1);
    tmp(1) <= input(3) XOR input(6) XOR input(7) XOR input(10) XOR input(11) XOR input(2);
    tmp(2) <= input(7) XOR input(6) XOR input(5) XOR input(4);
    tmp(3) <= input(11) XOR input(10) XOR input(9) XOR input(8);
    tmp0 <= input(1) XOR input(2) XOR input(3) XOR input(4) XOR input(5) XOR input(6) XOR
        input(7) XOR input(8) XOR input(9) XOR input(10) XOR input(11) XOR input(0);

    output(0) <= NOT input(3) WHEN tmp = "0011" AND tmp0 = '1' ELSE
    input(3);
    output(1) <= NOT input(5) WHEN tmp = "0101" AND tmp0 = '1' ELSE
    input(5);
    output(2) <= NOT input(6) WHEN tmp = "0110" AND tmp0 = '1' ELSE
    input(6);
    output(3) <= NOT input(7) WHEN tmp = "0111" AND tmp0 = '1' ELSE
    input(7);
    output(4) <= NOT input(9) WHEN tmp = "1001" AND tmp0 = '1' ELSE
    input(9);
    output(5) <= NOT input(10) WHEN tmp = "1010" AND tmp0 = '1' ELSE
    input(10);
    output(6) <= NOT input(11) WHEN tmp = "1011" AND tmp0 = '1' ELSE
    input(11);
    
    errors2 <= '1' WHEN tmp0 = '0' AND tmp /= "0000" ELSE
        '0';

END behavioral_receiver;
