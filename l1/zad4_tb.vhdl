entity zad4_tb is
end zad4_tb;
    
architecture behav of zad4_tb is
    component zad4
      port (a, b, c : in bit; x, y : out bit);
    end component;
  
    for zad4_0: zad4 use entity work.zad4;
    signal a, b, c, x, y : bit;
begin
    zad4_0: zad4 port map (a => a, b => b, c => c, x => x, y => y);
  
    process
      type pattern_type is record
        a, b, c : bit;
        x, y : bit;
      end record;
  
      type pattern_array is array (natural range <>) of pattern_type;
  
      constant patterns : pattern_array :=
        (('0', '0', '0', '0', '0'),
         ('0', '0', '1', '1', '0'),
         ('0', '1', '0', '0', '0'),
         ('0', '1', '1', '0', '0'),
         ('1', '0', '0', '0', '1'),
         ('1', '0', '1', '0', '0'),
         ('1', '1', '0', '0', '0'),
         ('1', '1', '1', '0', '0'));
    begin
      for i in patterns'range loop
        a <= patterns(i).a;
        b <= patterns(i).b;
        c <= patterns(i).c;
        wait for 1 ns;
        assert x = patterns(i).x
          report "bad sum value" severity error;
        assert y = patterns(i).y
          report "bad carry out value" severity error;
      end loop;
      assert false report "end of test" severity note;
      wait;
    end process;
  
end behav;
