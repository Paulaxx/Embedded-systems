library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std;

entity gate1 is
    generic(width : integer:=3);
    port (A, B, C : in std_logic_vector(width-1 downto 0);
            X : out std_logic_vector(width-1 downto 0)
            );
end gate1;

architecture art1 of gate1 is
begin
   X <= A or B;
end art1;




