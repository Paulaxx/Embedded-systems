library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity zad5_tb is
end zad5_tb;

architecture archit of zad5_tb is

    component gate1 is
        generic (width : integer);
        port (
            A,B, C : in std_logic_vector(width-1 downto 0);
            X : out std_logic_vector(width-1 downto 0)
            );
    end component;

    component gate2 is
        generic (width : integer);
        port (
            A,B, C : in std_logic_vector(width-1 downto 0);
            Y : out std_logic_vector(width-1 downto 0)
            );
    end component;

    component gate3 is
        generic (width : integer);
        port (
            D, E : in std_logic_vector(width-1 downto 0);
            Z : out std_logic_vector(width-1 downto 0)
            );
    end component;

    constant width : integer := 3;
	signal A,B,C : std_logic_vector(width-1 downto 0);
	signal X,Y,Z : std_logic_vector(width-1 downto 0);

    
begin
    UUT1 : gate1 generic map (width => width)
        port map (A => A, B => B, C => C, X => X);
    UUT2 : gate2 generic map (width => width)
        port map (A => A, B => B, C => C, Y => Y);
    UUT3 : gate3 generic map (width => width)
        port map (D => X, E => Y, Z => Z);

    process
    begin
        A <= "100";
        B <= "000";
        C <= "000";
        wait for 100 ns;
        wait;
    end process;
    

end archit;

