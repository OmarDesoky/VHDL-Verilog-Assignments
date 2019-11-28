Library ieee;
Use ieee.std_logic_1164.all;



ENTITY ALU is
	port(	INA: in std_logic_vector(15 downto 0);
		INB: in std_logic_vector(15 downto 0);
		CARRYIN: in std_logic;
		SELECTION: in std_logic_vector(3 downto 0);
		CARRYOUT: out std_logic;
		OUTPUT: out std_logic_vector(15 downto 0) );
END ENTITY;

ARCHITECTURE archmain of ALU is

component partB is
	port(	a,b: in std_logic_vector(15 downto 0);
		sel: in std_logic_vector(1 downto 0);
		f: out std_logic_vector(15 downto 0) );
end component;

component partC is
	port(	a: in std_logic_vector(15 downto 0);
		cin: in std_logic;
		sel: in std_logic_vector(1 downto 0);
		cout: out std_logic;
		f: out std_logic_vector(15 downto 0) );
end component;

component partD is
	port(	a: in std_logic_vector(15 downto 0);
		cin: in std_logic;
		sel: in std_logic_vector(1 downto 0);
		cout: out std_logic;
		f: out std_logic_vector(15 downto 0) );
end component;
SIGNAL o1,o2,o3 :std_logic_vector(15 downto 0);
BEGIN

u1:partB port map(INA,INB,SELECTION(1 downto 0),o1);
	

u2:partC port map(INA,CARRYIN,SELECTION(1 downto 0),CARRYOUT,o2);
	


u3:partD port map(INA,CARRYIN,SELECTION(1 downto 0),CARRYOUT,o3);

OUTPUT <= (o1) when ( SELECTION(3 downto 2)="01" )
else ( o2 ) when ( SELECTION(3 downto 2)="10")
else (o3) when (SELECTION(3 downto 2)="11");
END archmain;