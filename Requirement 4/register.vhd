LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY register32 IS
PORT( Clk,Rst : IN std_logic;
d : IN std_logic_vector(7 DOWNTO 0);
q : OUT std_logic_vector(7 DOWNTO 0));
END register32;



ARCHITECTURE archregister OF register32 IS
COMPONENT DFF IS
PORT( d,Clk,Rst : IN std_logic;
q : OUT std_logic);
END COMPONENT;


BEGIN

loop1: FOR i IN 0 TO 7 GENERATE
fx: DFF PORT MAP(d(i),Clk,Rst,q(i));
END GENERATE;

END archregister;