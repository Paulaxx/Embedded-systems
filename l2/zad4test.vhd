library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity zad4test is
end zad4test;


architecture behav of zad4test is

    component Xand is
        generic (width : integer);
        port ( clk : in std_logic;
        A,B : in std_logic_vector(width-1 downto 0);
        C : out std_logic_vector(width-1 downto 0)
        );
    end component;

    constant width : integer := 3;
    -- constant width : integer := 5;
    signal clk : std_logic;
	signal A,B : std_logic_vector(width-1 downto 0);
	signal C : std_logic_vector(width-1 downto 0);

    
begin
    UUT : Xand generic map (width => width)
          port map (clk => clk, A => A, B => B, C => C);

    process(clk)
    begin
        A <= "100";
        B <= "000";
        -- A <= "10011";
        -- B <= "00011";
        clk <= not clk after 50 ns;
    end process;
    

end behav;
    
