LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY bidir IS
    PORT(
	Clk,Rst : IN std_logic;
        bi   : INOUT STD_LOGIC_VECTOR (31 DOWNTO 0);
	datain :  in std_logic_vector ( 31 downto 0 );
	--dataout :  out std_logic_vector ( 31 downto 0 );
	selread   : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
	selwrite  : IN STD_LOGIC_VECTOR (2 DOWNTO 0);

	d1 : IN std_logic_vector(31 DOWNTO 0);

	d2 : IN std_logic_vector(31 DOWNTO 0);

	d3 : IN std_logic_vector(31 DOWNTO 0);

	d4 : IN std_logic_vector(31 DOWNTO 0));

END bidir;

ARCHITECTURE archmain OF bidir IS

component register32 IS
PORT( Clk,Rst : IN std_logic;
d : IN std_logic_vector(31 DOWNTO 0);
q : OUT std_logic_vector(32 DOWNTO 0));
END component;

SIGNAL o1,o2,o3,o4 :std_logic_vector(31 downto 0);

BEGIN


R1: register32 port map(Clk,Rst,d1,o1);
R2: register32 port map(Clk,Rst,d2,o2);
R3: register32 port map(Clk,Rst,d3,o3);
R4: register32 port map(Clk,Rst,d4,o4);

process(selread, bi, datain)
   begin
	if( selwrite="100" ) then
		datain <= o1;
		bi <=datain;
	elsif( selwrite="101" ) then
		datain <= o2;
		bi <=datain;
	elsif( selwrite="110" ) then
		datain <= o3;
		bi <=datain;
	elsif (selwrite="111" ) then
		datain <= o4;
		bi <=datain;
	else
		datain <="ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";	
		bi <=datain;
	end if;
	if( selread="100" ) then
		d1 <= bi;
		bi <=datain;
	elsif( selread="101" ) then
		d2 <= bi;
		bi <=datain;
	elsif( selread="110" ) then
		d3 <= bi;
		bi <=datain;
	elsif (selread="111" ) then
		d4 <= bi;
		bi <=datain;
	end if;

end process;
END archmain;
