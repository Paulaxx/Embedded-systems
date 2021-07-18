library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std;

entity gate3 is
    generic(width : integer:=3);
    port (D, E : in std_logic_vector(width-1 downto 0);
            Z : out std_logic_vector(width-1 downto 0)
            );
end gate3;

architecture art3 of gate3 is
begin
   Z <= D xor E;
end art3;