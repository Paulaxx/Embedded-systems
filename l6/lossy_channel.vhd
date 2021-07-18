-- experimental implementation of a lossy transmission channel
-- channel transports N-bit vectors and determines at random
-- if/which bit(s) should be flipped 
-- there is no transmission delay implemented

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity lossy_channel is
    generic (N : positive := 8); 
    Port ( data_in : in  STD_LOGIC_VECTOR (N-1 downto 0);
           clk : in  STD_LOGIC;
           data_out : out  STD_LOGIC_VECTOR (N-1 downto 0));
end lossy_channel;

architecture Behavioral of lossy_channel is
   
	signal q_rand  : std_logic_vector(15 downto 0);
	signal decision: std_logic_vector(2 downto 0);
	signal place1   : std_logic_vector(3 downto 0);
	signal place2   : std_logic_vector(3 downto 0);
	component lfsr 
		port ( clk : in  STD_LOGIC;
            q : inout  STD_LOGIC_VECTOR(15 downto 0));
	end component;

begin

randomizer: lfsr port map 
   ( clk => clk,
	     q => q_rand);

  -- three bits determine if bit is filpped
  decision <= q_rand(1) & q_rand(4) & q_rand(13);
  -- four bits determine which bit is flipped
  place1    <= q_rand(0) & q_rand(5) & q_rand(10) & q_rand(14);
  place2    <= q_rand(2) & q_rand(7) & q_rand(8) & q_rand(12);
							
p1: process(clk)
begin
  if decision = "110"			-- decision to flip one bit
  then
    for I in data_in'range loop
		if I = to_integer(unsigned(place1))
		then
			data_out(I) <= not data_in(I);
		else
			data_out(I) <= data_in(I);
		end if;
	 end loop;
  elsif decision = "010"  -- decision to flip two bits
  then
    for I in data_in'range loop
		if I = to_integer(unsigned(place1)) 
		   or
       I = to_integer(unsigned(place2))
		then
			data_out(I) <= not data_in(I);
		else
			data_out(I) <= data_in(I);
		end if;
	 end loop;
  else
	  data_out <= data_in;
  end if;
end process;

end Behavioral;

