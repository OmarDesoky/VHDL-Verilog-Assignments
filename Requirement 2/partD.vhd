LIBRARY IEEE;
USE IEEE.std_logic_1164.all;


ENTITY partD is
GENERIC (n : integer := 8);
	port(	a: in std_logic_vector(n-1 downto 0);
		cin: in std_logic;
		sel: in std_logic_vector(1 downto 0);
		cout: out std_logic;
		f: out std_logic_vector(n-1 downto 0) );
END ENTITY partD;


ARCHITECTURE arch4 OF partD IS
BEGIN

f <=  	( a(n-2 downto 0) & "0" )  when (sel="00")
else	( a(n-2 downto 0) & a(n-1) ) when ( sel="01")
else	( a(n-2 downto 0) & cin ) when ( sel="10")
else	( a and not(a) ) when ( sel="11") ;




cout <= ( a(n-1) ) when ( sel="00" )
else ( a(n-1) ) when ( sel="01")
else ( a(n-1) ) when ( sel="10")
else ('U') when ( sel="11");

END arch4;