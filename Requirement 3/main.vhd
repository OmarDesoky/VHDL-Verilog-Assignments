LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY bidir IS
    PORT(
	Clk,Rst : IN std_logic;
        bi   : INOUT STD_LOGIC_VECTOR (31 DOWNTO 0);
	selread   : IN STD_LOGIC_VECTOR (2 DOWNTO 0);			-- read from bus into reg
	selwrite  : IN STD_LOGIC_VECTOR (2 DOWNTO 0);			-- write in bus from reg
	load : IN STD_LOGIC_VECTOR (1 DOWNTO 0);			-- load in which reg
	load_trans  : IN std_logic );					-- load or transfer between reg

END bidir;

ARCHITECTURE archmain OF bidir IS

component register32 IS
PORT( Clk,Rst : IN std_logic;
d : IN std_logic_vector(31 DOWNTO 0);
q : OUT std_logic_vector(31 DOWNTO 0));
END component;

SIGNAL o1,o2,o3,o4 :std_logic_vector(31 downto 0);
SIGNAL d1,d2,d3,d4 :std_logic_vector(31 downto 0);
BEGIN


R1: register32 port map(Clk,Rst,d1,o1);
R2: register32 port map(Clk,Rst,d2,o2);
R3: register32 port map(Clk,Rst,d3,o3);
R4: register32 port map(Clk,Rst,d4,o4);

process(load_trans,load,selwrite,selread, bi,Clk,Rst,d1,d2,d3,d4,o1,o2,o3,o4)
   begin
	if(load_trans ='0') then				-- 0 means load
		if(load="00") then
			d1<=bi;
		elsif(load="01") then
			d2<=bi;
		elsif(load="10") then
			d3<=bi;
		else
			d4<=bi;
		end if;
	else
		if( selwrite="100" ) then
			bi<=o1;
		elsif(selwrite="101" ) then
			bi<=o2;
		elsif(selwrite="110" ) then
			bi<=o3;
		elsif(selwrite="111" ) then
			bi<=o4;
		end if;
		
		if( selread="100" ) then
			d1<=bi;
		elsif(selread="101" ) then
			d2<=bi;
		elsif(selread="110" ) then
			d3<=bi;
		elsif(selread="111" ) then
			d4<=bi;
		end if;
	end if;
	
end process;
END archmain;
