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


component my_nadder IS
GENERIC (n : integer := 8);
PORT(a,b : IN std_logic_vector(n-1 DOWNTO 0);
cin : IN std_logic;
s : OUT std_logic_vector(n-1 DOWNTO 0);
cout : OUT std_logic);
END component;


signal tempa : std_logic_vector(n-1 downto 0);
signal tempb : std_logic_vector(n-1 downto 0);
signal tempcin:std_logic;
signal tempcout:std_logic;
signal tempf : std_logic_vector(n-1 downto 0);


BEGIN

u1:my_nadder GENERIC MAP(n=>8) port map(tempa,tempb,tempcin,tempf,tempcout);

PROCESS (a,b,sel,cin,tempa,tempb,tempcin,tempf,tempcout) IS
BEGIN
CASE sel IS
  WHEN "00" =>
	tempa<=a;
	tempb<= a and not(a);
	tempcin<=cin;
	f<=tempf;
	cout<=tempcout;
  WHEN "01" =>
	tempa<=a;
	tempb<=b;
	tempcin<=cin;
	f<=tempf;
	cout<=tempcout;
  WHEN "10" =>
	tempa<=a;
	tempb<=not(b);
	tempcin<=cin;
	f<=tempf;
	cout<=tempcout;
  WHEN OTHERS  =>
	CASE cin IS
	  WHEN '1' =>
		f <= a and not(a);
	  WHEN OTHERS =>
		tempa<=a;
		tempb<=(others =>'1') ;
		tempb(0) <= '0';
		tempcin<=cin;
		f<=tempf;
		cout<=tempcout;
	END CASE;
END CASE;
END PROCESS;
END arch1;