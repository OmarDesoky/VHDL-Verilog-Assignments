Library ieee;
Use ieee.std_logic_1164.all;

entity fullAdder is
    port(
        a,b,cin: in std_logic;
        sum,cout: out std_logic
        );
end entity;

architecture fullAdderArch of fullAdder is

begin
    sum <= a xor b xor cin;
    cout <= (a and b) or ( cin and (a or b) );
end fullAdderArch;