LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY testbench IS
END testbench;

ARCHITECTURE testbench_arch OF testbench IS

	component main IS
	PORT(
	Clk,Rst : IN std_logic;
        bi   : INOUT STD_LOGIC_VECTOR (7 DOWNTO 0);
	selread   : IN STD_LOGIC_VECTOR (3 DOWNTO 0);			-- read from bus into reg
	selwrite  : IN STD_LOGIC_VECTOR (3 DOWNTO 0);			-- write in bus from reg
	load : IN STD_LOGIC_VECTOR (2 DOWNTO 0);			-- load in which reg
	load_trans  : IN STD_LOGIC_VECTOR(1 DOWNTO 0) );			-- load or transfer between reg
	END component;

	
	SIGNAL bi, load, load_trans,selread,selwrite,Marin,MDRin,MDRout : std_logic_vector;
	SIGNAl we,Clk,Rst : std_logic;
	BEGIN
		PROCESS
			BEGIN
				bi <= "00000010";
				load <= "111";
				load_trans<="10";
				we<='0';
				WAIT FOR 10 ns;
				ASSERT(MARin ="00000010");
				
				bi <= "00101010";
				load <= "011";
				load_trans<="11";
				selread<="1110";
				selwrite<="0110";
				we<='1';
				WAIT FOR 10 ns;
				ASSERT(MDRout ="00101010");

				

				bi <= "00010010";
				load <= "111";
				load_trans<="10";
				selread<="0110";
				selwrite<="0110";
				we<='0';
				WAIT FOR 10 ns;
				ASSERT(MARin ="00010010");


				bi <= "00000101";
				load <= "011";
				load_trans<="11";
				selread<="1110";
				selwrite<="0110";
				we<='1';
				WAIT FOR 10 ns;
				ASSERT(MDRout ="00000101");


				bi <= "00000010";
				load <= "111";
				load_trans<="10";
				selread<="0110";
				selwrite<="0110";
				we<='0';
				WAIT FOR 10 ns;
				ASSERT(MARout ="00101010");


				-- Stop Simulation
				WAIT;
		END PROCESS;
		uut: main PORT MAP (Clk => Clk,Rst=>Rst, bi => bi, selread =>selread,selwrite=>selwrite,load=>load,load_trans=>load_trans);
		
END testbench_arch;


;


