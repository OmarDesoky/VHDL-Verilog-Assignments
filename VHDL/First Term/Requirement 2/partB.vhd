LIBRARY IEEE;
USE IEEE.std_logic_1164.all;


ENTITY partB is
GENERIC (n : integer := 8);
	port(	a,b: in std_logic_vector(n-1 downto 0);
		sel: in std_logic_vector(1 downto 0);
		f: out std_logic_vector(n-1 downto 0) );
END ENTITY partB;

ARCHITECTURE arch2 OF partB IS
BEGIN
     
f <= ( a and b ) when ( sel="00" )
else ( a or b) when ( sel="01")
else ( a xor b ) when ( sel="10")
else ( not a ) when ( sel="11") ;

END arch2;