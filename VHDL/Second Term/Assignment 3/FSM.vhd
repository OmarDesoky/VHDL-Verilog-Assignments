Library ieee;
use ieee.std_logic_1164.all;

entity testMachine is
    port (  input,clk,rst : in std_logic; -- 1 = taken   // 0 = not taken
            output : out std_logic_vector(1 downto 0));           
end entity;

architecture FSM of testMachine is
    -- start start is strong_not_taken
    type states is (strong_not_taken,weak_not_taken,weak_taken,strong_taken);
    signal current_state : states := strong_not_taken;
   
begin
    -- update current_state state based on input and current state
    process (clk,rst)
        begin
            if rst = '1' then current_state <= strong_not_taken;
            elsif rising_edge(clk) then
                case current_state is
                    when strong_not_taken =>
                        if input = '1' then current_state <= weak_not_taken; else current_state <= strong_not_taken; end if;
                    when weak_not_taken =>
                        if input = '1' then current_state <= weak_taken; else current_state <= strong_not_taken; end if;    
                    when weak_taken =>
                        if input = '1' then current_state <= strong_taken; else current_state <= weak_not_taken; end if;    
                    when strong_taken =>
                        if input = '1' then current_state <= strong_taken; else current_state <= weak_taken; end if;    
                end case;
            end if;
        end process;


    process (current_state)
        begin
            case current_state is
                when strong_not_taken =>
                    output <= "00";
                when weak_not_taken =>
                    output <= "01";
                when weak_taken =>
                    output <= "10";
                when strong_taken =>
                    output <= "11";
            end case;
        end process;

end architecture;
