library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std;

entity gate2 is
    generic(width : integer:=3);
    port (A, B, C : in std_logic_vector(width-1 downto 0);
        Y : out std_logic_vector(width-1 downto 0)
        );
end gate2;
  
architecture art2 of gate2 is
begin
    Y <= B and C;
end art2;
