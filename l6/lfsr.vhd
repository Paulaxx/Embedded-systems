library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity lfsr is
    Port ( clk : in  STD_LOGIC;
           q   : inout STD_LOGIC_VECTOR(15 downto 0) := (OTHERS => '0')
			);
end lfsr;

ARCHITECTURE Behavioral OF lfsr IS
  SIGNAL qq: STD_LOGIC_VECTOR(15 downto 0) := (OTHERS => '0');
BEGIN

-- cyclic register with taps
PROCESS
BEGIN
	qq(15 downto 1) <= qq(14 downto 0);
	qq(0) <= not(qq(15) XOR qq(14) XOR qq(13) XOR qq(4));
	WAIT UNTIL clk'event AND clk='1';
END PROCESS;

-- buffer collecting random bits
PROCESS
BEGIN
  q(15 downto 1) <= q(14 downto 0);
  q(0) <= qq(0);
  WAIT UNTIL clk'event AND clk='1';
END PROCESS;

END Behavioral;

