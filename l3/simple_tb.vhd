LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY simple_tb IS
END simple_tb;
 
ARCHITECTURE behavior OF simple_tb IS 
 
    COMPONENT simple
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         q : INOUT  unsigned(7 downto 0)
        );
    END COMPONENT;
    
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

   signal qq : unsigned(7 downto 0);
   constant clk_period : time := 20 ns;
 
BEGIN
   uut: simple PORT MAP (
          clk => clk,
          rst => rst,
          q   => qq
        );
   
   clk_process :PROCESS
   BEGIN
		clk <= '0';
		WAIT FOR clk_period/2;
		clk <= '1';
		WAIT FOR clk_period/2;
   END PROCESS;
 

   stim_proc: PROCESS
   BEGIN

      wait for 40 ns;
      rst <= '1';
      wait for 700 ns;
      rst <= '0';

      
      wait for 40 ns;
      rst <= '1';
      wait for 440 ns;
      rst <= '0';
      wait;
   END PROCESS;	
END;
