LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY sender IS
    PORT (
        input : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
        output : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
    );
END sender;

ARCHITECTURE behavioral_sender OF sender IS
BEGIN
    output(11) <= input(6);
    output(10) <= input(5);
    output(9) <= input(4);
    output(8) <= input(6) XOR input(5) XOR input(4);
    output(7) <= input(3);
    output(6) <= input(2);
    output(5) <= input(1);
    output(4) <= input(3) XOR input(2) XOR input(1);
    output(3) <= input(0);
    output(2) <= input(0) XOR input(2) XOR input(3) XOR input(5) XOR input(6);
    output(1) <= input(0) XOR input(1) XOR input(3) XOR input(4) XOR input(6);
    output(0) <= input(6) XOR input(5) XOR input(4) XOR input(3) XOR input(2) XOR input(1) XOR input(0) XOR
    input(6) XOR input(5) XOR input(4) XOR input(3) XOR input(2) XOR input(1) XOR
    input(0) XOR input(2) XOR input(3) XOR input(5) XOR input(6) XOR
    input(0) XOR input(1) XOR input(3) XOR input(4) XOR input(6);
END behavioral_sender;
