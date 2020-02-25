library ieee ;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

entity Timer is

generic (size : integer := 16);

port (
a : in std_logic_vector (size-1 downto 0) ;
read_enable : in std_logic ;
clk : in std_logic;
output : out std_logic_vector (size-1 downto 0));
end Timer ;

architecture Timer_a of Timer is
signal output_int : unsigned (size-1 downto 0);

begin
output <= std_logic_vector (output_int);

process(clk)
begin
if rising_edge(clk) then
if read_enable = '1' then
output_int <= unsigned(a);
elsif output_int > 0 then
output_int <= output_int - 1;
end if;
end if;
end process;
end Timer_a;