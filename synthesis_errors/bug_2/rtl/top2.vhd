library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


entity top2 is
    Port ( a : in std_logic_vector(3 downto 0);
           b : in std_logic_vector(3 downto 0);
           c : out std_logic_vector(3 downto 0));
end top2;

architecture Behavioral of top2 is
begin
    process (a, b)
    begin
        c <= a + b; 
    end process;
end Behavioral;

