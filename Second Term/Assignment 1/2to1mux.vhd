Library ieee;
Use ieee.std_logic_1164.all;

entity mux2to1 is
    port(
        a,b: in std_logic_vector(1 downto 0);
        sel : in std_logic;                                 --cin
        carrya,carryb : in std_logic;
        result: out std_logic_vector(1 downto 0);
        carry: out std_logic                                --cout
        );
end entity;

architecture mux2to1Arch of mux2to1 is

begin
    result<=a when sel='0'
    else b when sel='1';

    carry<=carrya when sel='0'
    else carryb when sel='1';
end mux2to1Arch;