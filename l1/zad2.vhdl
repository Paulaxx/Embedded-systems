use std.textio.all;


entity zad2 is
end zad2;


architecture behaviour of zad2 is
begin
  process
    variable l : line;
    variable l2 : line;
  begin
    readline(input, l2);
    write (l, String'("Hello world!"));
    writeline (output, l);
    writeline (output, l2);
    wait;
  end process;
end behaviour;
