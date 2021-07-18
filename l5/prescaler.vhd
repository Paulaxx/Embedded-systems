library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity clock1 is 
port (
	clk: in std_logic;
	clka: out std_logic -- 125MHz/100 Hz = 1250000| 1250000/2 => 625000
);
end clock1;

architecture clk1 of clock1 is
	constant MaxA :  unsigned (19 downto 0) := "10011000100101101000";
	signal clkatemp: std_logic := '0';
begin
	process(clk)
	variable CountA :  unsigned (19 downto 0) := (others => '0');
	begin
		if rising_edge(clk) then
			CountA := CountA + 1;
			if CountA = MaxA then
				CountA := "00000000000000000000";
				clkatemp <= not clkatemp;
			end if;
		end if;
		clka <= clkatemp;
	end process;
end clk1;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity clock2 is 
port (
	clk: in std_logic;
	clkb: out std_logic -- 125MHz/1.1 kHz ~ 113636 | 113636/ 2 => 56818
);
end clock2;

architecture clk2 of clock2 is
	constant MaxB :  unsigned (15 downto 0):="1101110111110010";
	signal clkbtemp: std_logic := '0';
begin
	process(clk)
	variable CountB :  unsigned (15 downto 0) := (others => '0');
	begin
		if rising_edge(clk) then
			CountB := CountB + 1;
			if CountB = MaxB then
				CountB := "0000000000000000";
				clkbtemp <= not clkbtemp;
			end if;
		end if;
		clkb <= clkbtemp;
	end process;
end clk2;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity clock3 is 
port (
	clk: in std_logic;
	clkc: out std_logic	 -- 125MHz/50 MHz = 2.5 | 2.5 / 2 => 1
);
end clock3;

architecture clk3 of clock3 is
	constant MaxC :  unsigned (0 downto 0):="1";
	signal clkctemp: std_logic := '0';
begin
	process(clk)
	variable CountC : unsigned (0 downto 0) := (others => '0');
	begin
		if rising_edge(clk) then
			CountC := CountC + 1;
			if CountC = MaxC then
				CountC := "0";
				clkctemp <= not clkctemp;
			end if;
		end if;
		clkc <= clkCtemp;
	end process;
end clk3;
