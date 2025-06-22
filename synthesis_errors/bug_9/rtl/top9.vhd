library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top9 is
    port (
        a : in std_logic;
        b : out std_logic
    );
end entity top9;

architecture rtl of top9 is
    signal temp_signal : std_logic;
begin
    temp_signal <= a and b;
end architecture rtl;

