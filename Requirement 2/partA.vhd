LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
--use ieee.numeric_std.all;

ENTITY partA is
GENERIC (n : integer := 8);
	port(	a,b: in std_logic_vector(n-1 downto 0);
		sel: in std_logic_vector(1 downto 0);
		cin: in std_logic;
		cout: out std_logic;
		f: out std_logic_vector(n-1 downto 0));

END ENTITY partA;

ARCHITECTURE arch1 OF partA IS
signal temp : std_logic_vector(n downto 0);

BEGIN
PROCESS (a,b,sel,cin,temp) IS
BEGIN
CASE sel IS
  WHEN "00" =>
        temp <= ('0' & a) + cin;
        f <= temp((n-1) downto 0);
       	cout <= temp(n);
  WHEN "01" =>
        temp <= ('0' & a) +('0' & b) + cin;
        f <= temp((n-1) downto 0);
       	cout <= temp(n);
  WHEN "10" =>
        temp <= ('0' & a) - ('0' & b) - not(cin);
        f <= temp((n-1) downto 0);
       	cout <= temp(n);
  WHEN OTHERS  =>
	CASE cin IS
	  WHEN '1' =>
		f <= a and not(a);
	  WHEN OTHERS =>
		temp <= ('0' & a) - not(cin);
		f <= temp((n-1) downto 0);
       		cout <= temp(n);
	END CASE;
END CASE;
END PROCESS;
END arch1;