library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity prescaler_multi is 
generic ( NBit : natural := 7 );
port (
	clk: in std_logic;
	clkout: out std_logic_vector(NBit downto 0)		
);
end prescaler_multi;

architecture multi of prescaler_multi is
begin
	process(clk)
	    variable  count : std_logic_vector(clkout'range) := (others => '0');
 	begin
		if rising_edge(clk) then
			count := std_logic_vector(unsigned(count)+1);
		else
			null;
		end if;
	clkout <= count;
	end process;
end multi;