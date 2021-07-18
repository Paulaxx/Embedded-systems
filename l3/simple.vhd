----------------------------------------------------------------------------------
-- Design Name: 
-- Module Name:    simple - simple_counter_arch 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Additional Comments: kod na podstawie
--		Majewski, Zbysinski "Uklady FPGA w przykladach"
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity simple is
	generic ( NBit : natural := 8 );
   port  ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
             q : inout  unsigned( NBit-1 downto 0)
				 );
end simple;

architecture simple_counter_arch of simple is

BEGIN
  PROCESS(clk, rst)
  BEGIN
	IF rst = '0' THEN 
		q <= ('1','0','1','0', OTHERS => '0');
	ELSIF (clk'event and clk='1') THEN
		   q <= q + 1;
		END IF;
  END PROCESS;
END simple_counter_arch;

