Library ieee;
Use ieee.std_logic_1164.all;



ENTITY ALSU is
GENERIC (n : integer := 8);
	port(	INA: in std_logic_vector(n-1 downto 0);
		INB: in std_logic_vector(n-1 downto 0);
		CARRYIN: in std_logic;
		SELECTION: in std_logic_vector(3 downto 0);
		CARRYOUT: out std_logic;
		OUTPUT: out std_logic_vector(n-1 downto 0) );
END ENTITY;

ARCHITECTURE archmain of ALSU is

component partA is
GENERIC (n : integer := 8);
	port(	a,b: in std_logic_vector(n-1 downto 0);
		sel: in std_logic_vector(1 downto 0);
		cin: in std_logic;
		cout: out std_logic;
		f: out std_logic_vector(n-1 downto 0));

END component;

component partB is
GENERIC (n : integer := 8);
	port(	a,b: in std_logic_vector(n-1 downto 0);
		sel: in std_logic_vector(1 downto 0);
		f: out std_logic_vector(n-1 downto 0) );
end component;

component partC is
GENERIC (n : integer := 8);
	port(	a: in std_logic_vector(n-1 downto 0);
		cin: in std_logic;
		sel: in std_logic_vector(1 downto 0);
		cout: out std_logic;
		f: out std_logic_vector(n-1 downto 0) );
end component;

component partD is
GENERIC (n : integer := 8);
	port(	a: in std_logic_vector(n-1 downto 0);
		cin: in std_logic;
		sel: in std_logic_vector(1 downto 0);
		cout: out std_logic;
		f: out std_logic_vector(n-1 downto 0) );
end component;

SIGNAL o1,o2,o3,o4 :std_logic_vector(n-1 downto 0);
SIGNAL c1,c3,c4 :std_logic;
BEGIN

u1:partA GENERIC MAP(n=>8) port map(INA,INB,SELECTION(1 downto 0),CARRYIN,c1,o1);	
						
u2:partB GENERIC MAP(n=>8) port map(INA,INB,SELECTION(1 downto 0),o2);
	

u3:partC GENERIC MAP(n=>8) port map(INA,CARRYIN,SELECTION(1 downto 0),c3,o3);
	


u4:partD GENERIC MAP(n=>8) port map(INA,CARRYIN,SELECTION(1 downto 0),c4,o4);

OUTPUT <= (o1) when ( SELECTION(3 downto 2)="00" )
else ( o2 ) when ( SELECTION(3 downto 2)="01")
else ( o3 ) when ( SELECTION(3 downto 2)="10")
else (o4) when (SELECTION(3 downto 2)="11");

CARRYOUT <= (c1) when ( SELECTION(3 downto 2)="00" )
else ( 'U' ) when ( SELECTION(3 downto 2)="01")
else ( c3 ) when ( SELECTION(3 downto 2)="10")
else (c4) when (SELECTION(3 downto 2)="11");

END archmain;