LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY testBench IS
END testBench;

ARCHITECTURE testBench_a OF testBench IS
	
component Timer is
generic (size : integer := 16);
    port (
        a : in std_logic_vector (size-1 downto 0) ;
        read_enable : in std_logic ;
        clk : in std_logic;
        output : out std_logic_vector (size-1 downto 0)
        );
end component;

signal enable : std_logic;
signal  clok : std_logic := '0';
signal ina, result : std_logic_vector (4 downto 0);
constant half_period : time := 50 ps;

begin

    process
    begin
        clok <= not clok after half_period;
        wait for 50 ps;
    end process;

    process
    begin

        -- Test Case 1
        ina<="01101";
        enable<='1';
        wait for 100 ps;
        assert(result = "01101");
        report "Result became a=01101";

        -- Test Case 2
        ina<="00001";
        enable<='0';
        wait for 100 ps;
        assert(result = "01100");
        report "Result Decremented from 01101 to 01100";

        -- Test Case 3
        ina<="00000";
        enable<='1';
        wait for 100 ps;
        assert(result = "00000");
        report "Result became a=00000";

        -- Test Case 4
        ina<="00000";
        enable<='0';
        wait for 100 ps;
        assert(result = "00000");
        report "Result is still 00000";

    end process;
    
    u1: Timer generic map(size=>5) port map (a => ina, read_enable => enable, clk =>clok, output => result);


END testBench_a;    
