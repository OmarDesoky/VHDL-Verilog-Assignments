LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY DFF IS
PORT( d,clk,rst : IN std_logic; q : OUT std_logic);
END DFF;

ARCHITECTURE archDFF OF DFF IS
BEGIN
PROCESS(clk,rst)
BEGIN
IF(rst = '1') THEN
q <= '0';
ELSIF rising_edge(clk) THEN
q <= d;
END IF;
END PROCESS;
END archDFF;