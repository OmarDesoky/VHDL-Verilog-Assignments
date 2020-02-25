Library ieee;
use ieee.std_logic_1164.all;

entity TEST_B_Machine is
end entity;

Architecture TestFSM of TEST_B_Machine is
    Signal T_input,T_clk,T_rst : std_logic := '0';
    Signal T_output : std_logic_vector(1 downto 0);
    constant CLK_PERIOD : time := 100 ps;
begin
    u1: entity work.testMachine(FSM) port map (T_input,T_clk,T_rst,T_output);

process 
    begin
        T_clk <= not T_clk;
        wait for CLK_PERIOD/2;
    end process;

process
    begin

        -- resetting state to intial state
        T_rst <= '1';
        wait for CLK_PERIOD;
        assert(T_output = "00");
        report "State is Strongly not Taken";
        T_rst <= '0';

        ----------   test if input = 1
        T_input<='1';
        wait for CLK_PERIOD;
        assert(T_output = "01");
        report "State is Weaky not Taken";

        T_input<='1';
        wait for CLK_PERIOD;
        assert(T_output = "10");
        report "State is Weaky Taken";

        T_input<='1';
        wait for CLK_PERIOD;
        assert(T_output = "11");
        report "State is Strongly Taken";

        T_input<='1';
        wait for CLK_PERIOD;
        assert(T_output = "11");
        report "State is Still Strongly Taken";
        ----------



        ----------    test if input = 0
        T_input<='0';
        wait for CLK_PERIOD;
        assert(T_output = "10");
        report "State is Weaky Taken";


        T_input<='0';
        wait for CLK_PERIOD;
        assert(T_output = "01");
        report "State is Weaky not Taken";


        T_input<='0';
        wait for CLK_PERIOD;
        assert(T_output = "00");
        report "State is Strongly not Taken";


        T_input<='0';
        wait for CLK_PERIOD;
        assert(T_output = "00");
        report "State is still Strongly not Taken";
        ----------

        Wait;
    end process;

end architecture;




