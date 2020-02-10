Library ieee;
Use ieee.std_logic_1164.all;

entity twoFAdder is
    port(
        a,b: in std_logic_vector(1 downto 0);
        cin: in std_logic;
        sum: out std_logic_vector(1 downto 0);
        cout: out std_logic
        );
end entity;

architecture fullAdderArch of twoFAdder is

component fullAdder is
    port(
        a,b,cin: in std_logic;
        sum,cout: out std_logic
        );
end component;
signal carry : std_logic;
begin
    u1:fullAdder port map(a(0),b(0),cin,sum(0),carry);
    u2:fullAdder port map(a(1),b(1),carry,sum(1),cout);
end fullAdderArch;