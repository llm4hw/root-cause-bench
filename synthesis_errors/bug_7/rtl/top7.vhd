----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.03.2024 02:25:31
-- Design Name: 
-- Module Name: ConcurrentSequentialError - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top7 is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           out1 : out STD_LOGIC);
end top7;

architecture Behavioral of top7 is
    signal signal1 : STD_LOGIC := '0';
begin
    process (clk)
    begin
        if rising_edge(clk) then
            signal1 <= not signal1;
        end if;
        wait for 10 ns;
    end process;

    out1 <= signal1;
end Behavioral;

