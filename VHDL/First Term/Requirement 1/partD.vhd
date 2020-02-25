LIBRARY IEEE;
USE IEEE.std_logic_1164.all;


ENTITY partD is
	port(	a: in std_logic_vector(15 downto 0);
		cin: in std_logic;
		sel: in std_logic_vector(1 downto 0);
		cout: out std_logic;
		f: out std_logic_vector(15 downto 0) );
END ENTITY partD;


ARCHITECTURE arch3 OF partD IS
BEGIN

f <=  	( a(14 downto 0) & "0" )  when (sel="00")
else	( a(14 downto 0) & a(15) ) when ( sel="01")
else	( a(14 downto 0) & cin ) when ( sel="10")
else	( a and not(a) ) when ( sel="11") ;




cout <= ( a(15) ) when ( sel="00" )
else ( a(15) ) when ( sel="01")
else ( a(15) ) when ( sel="10")
else ('U') when ( sel="11");

END arch3;