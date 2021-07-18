LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
 
 
ENTITY example_tb IS
END example_tb;
 
ARCHITECTURE behavior OF example_tb IS 
 
    COMPONENT example
    PORT(
         a : IN  std_logic;
         b : IN  std_logic;
         c : IN  std_logic;
         x : OUT  std_logic
        );
    END COMPONENT;

   signal a : std_logic := '0';
   signal b : std_logic := '0';
   signal c : std_logic := '0';

   signal abc : std_logic_vector(2 downto 0) := (others => '0');


   signal x : std_logic;
   constant period : time := 10 ns;
 
BEGIN
 
   uut: example PORT MAP (
          a => a,
          b => b,
          c => c,
          x => x
        );

   stim_proc: process
   begin		
      wait for 100 ns;	

      wait for period*10;

	a <= '0';
	b <= '0';
	c <= '1';
	wait for period;
		
	a <= '0';
	b <= '1';
	c <= '0';
	wait for period;

	a <= '0';
	b <= '1';
	c <= '1';
	wait for period;

	a <= '1';
	b <= '0';
	c <= '0';
	wait for period;

	a <= '1';
	b <= '0';
	c <= '1';
	wait for period;

	a <= '1';
	b <= '1';
	c <= '0';
	wait for period;

	a <= '1';
	b <= '1';
	c <= '1';

	wait for 10*period;
		
	for i in 0 to 6 loop
      abc <= std_logic_vector( unsigned(abc) + 1 );
	  a <= abc(2);
	  b <= abc(1);
	  c <= abc(0);
	  wait for period;
	end loop;



      wait;
   end process;

END;
