entity zad4 is
    port (a, b, c : in bit; x, y : out bit);
  end zad4;
  
  architecture rtl of zad4 is
  begin
    x <= (b or a) nor (c nor b);
    y <= (c nor b) and (a xor c);
  end rtl;