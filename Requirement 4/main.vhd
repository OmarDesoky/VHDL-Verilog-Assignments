LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY main IS
    PORT(
	Clk,Rst : IN std_logic;
        bi   : INOUT STD_LOGIC_VECTOR (7 DOWNTO 0);
	selread   : IN STD_LOGIC_VECTOR (3 DOWNTO 0);			-- read from bus into reg
	selwrite  : IN STD_LOGIC_VECTOR (3 DOWNTO 0);			-- write in bus from reg
	load : IN STD_LOGIC_VECTOR (2 DOWNTO 0);			-- load in which reg
	load_trans  : IN STD_LOGIC_VECTOR(1 DOWNTO 0) );			-- load or transfer between reg

END main;

ARCHITECTURE archmain OF main IS

component register32 IS
PORT( Clk,Rst : IN std_logic;
d : IN std_logic_vector(7 DOWNTO 0);
q : OUT std_logic_vector(7 DOWNTO 0));
END component;

component ram IS
	PORT(
		clk : IN std_logic;
		we  : IN std_logic;
		address : IN  std_logic_vector(7 DOWNTO 0);
		datain  : IN  std_logic_vector(7 DOWNTO 0);
		dataout : OUT std_logic_vector(7 DOWNTO 0));
END component;


SIGNAL o1,o2,o3,o4,o5,o6 :std_logic_vector(7 downto 0);
SIGNAL d1,d2,d3,d4,d5,d6 :std_logic_vector(7 downto 0);
SIGNAL MDRin,MDRout,MARin :std_logic_vector(7 downto 0);
SIGNAL we : std_logic;
BEGIN


R1: register32 port map(Clk,Rst,d1,o1);
R2: register32 port map(Clk,Rst,d2,o2);
R3: register32 port map(Clk,Rst,d3,o3);
R4: register32 port map(Clk,Rst,d4,o4);
R5: register32 port map(Clk,Rst,d5,o5);
R6: register32 port map(Clk,Rst,d6,o6);
MAR: register32 port map(Clk,Rst,MARin);
MDR: register32 port map(Clk,Rst,MDRin,MDRout);
mem: ram port map(Clk,we,MARin,MDRin,MDRout);

process(load_trans,load,selwrite,selread, bi,Clk,Rst,d1,d2,d3,d4,d5,d6,o1,o2,o3,o4,o5,o6,Marin,MDRin,MDRout,we)
   begin
	if(load_trans ="10") then				-- 100 means load			0X mens disabled
		if(load="000") then
			d1<=bi;
		elsif(load="001") then
			d2<=bi;
		elsif(load="010") then
			d3<=bi;
		elsif(load="011") then
			d4<=bi;
		elsif(load="100") then
			d5<=bi;
		elsif(load="101") then
			d6<=bi;
		elsif((load="110") and (we='1') ) then
			MDRin<=bi;				-- load data into MARin
		elsif(load = "111") then
			MDRin<="ZZZZZZZZ";
			MARin<=bi;				-- load data into MDRin
			
		end if;
	elsif(load_trans ="11") then 				--101 means transfer 			0X mens disabled
		if( selwrite="1000" ) then			-- 0XXX means disabled
			bi<=o1;
		elsif(selwrite="1001" ) then
			bi<=o2;
		elsif(selwrite="1010" ) then
			bi<=o3;
		elsif(selwrite="1011" ) then
			bi<=o4;
		elsif(selwrite="1100" ) then
			bi<=o5;
		elsif(selwrite="1101" ) then
			bi<=o6;
		elsif(selwrite="1110" ) then			-- transfer from MDR to Bus
			MDRin<="ZZZZZZZZ";
			bi<=MDRout;
		
		end if;
		
		if( selread="1000" ) then			-- 0XXX means disabled
			d1<=bi;
		elsif(selread="1001" ) then
			d2<=bi;
		elsif(selread="1010" ) then
			d3<=bi;
		elsif(selread="1011" ) then
			d4<=bi;
		elsif(selread="1100" ) then
			d5<=bi;
		elsif(selread="1101" ) then
			d6<=bi;		
		elsif(selread="1110"  and (we='1') ) then			-- transfer from bus to MDR
			MDRin<=bi;	
		elsif(selread="1111") then			-- transfer from bus to MAR
			MDRin<="ZZZZZZZZ";
			MARin<=bi;
		end if;
	end if;
	
end process;
END archmain;