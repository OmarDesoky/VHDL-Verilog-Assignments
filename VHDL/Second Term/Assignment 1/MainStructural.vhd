Library ieee;
Use ieee.std_logic_1164.all;

entity mainStructural is
    port(
        a,b: in std_logic_vector(7 downto 0);
        cin: in std_logic;
        sum: out std_logic_vector(7 downto 0);
        cout: out std_logic
        );
end entity;

architecture mainStructArch of mainStructural is
component twoFAdder is
    port(
        a,b: in std_logic_vector(1 downto 0);
        cin: in std_logic;
        sum: out std_logic_vector(1 downto 0);
        cout: out std_logic
        );
end component;

component mux2to1 is
    port(
        a,b: in std_logic_vector(1 downto 0);
        sel : in std_logic;                                 --cin
        carrya,carryb : in std_logic;
        result: out std_logic_vector(1 downto 0);
        carry: out std_logic                                --cout
        );
end component;

signal carry1,carry2 : std_logic_vector(3 downto 1);
signal ans1,ans2 : std_logic_vector(7 downto 0);
signal carryin : std_logic_vector(2 downto 0);
begin
    start:twoFAdder port map(a(1 downto 0),b(1 downto 0),cin,sum(1 downto 0),carryin(0));

    genComp:for i in 1 to 2 generate
        adder0 : twoFAdder port map(a(i*2+1 downto i*2),b(i*2+1 downto i*2),'0',ans1(i*2+1 downto i*2),carry1(i));
        adder1 : twoFAdder port map(a(i*2+1 downto i*2),b(i*2+1 downto i*2),'1',ans2(i*2+1 downto i*2),carry2(i));
        mux : mux2to1 port map(ans1(i*2+1 downto i*2),ans2(i*2+1 downto i*2),carryin(i-1),carry1(i),carry2(i),sum(i*2+1 downto i*2),carryin(i));
    end generate genComp;
    
    adder0 : twoFAdder port map(a(7 downto 6),b(7 downto 6),'0',ans1(7 downto 6),carry1(3));
    adder1 : twoFAdder port map(a(7 downto 6),b(7 downto 6),'1',ans2(7 downto 6),carry2(3));    
    mux : mux2to1 port map(ans1(7 downto 6),ans2(7 downto 6),carryin(2),carry1(3),carry2(3),sum(7 downto 6),cout);

end mainStructArch;