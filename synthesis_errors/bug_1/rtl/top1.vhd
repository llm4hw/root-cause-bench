----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.03.2024 18:53:48
-- Design Name: 
-- Module Name: top0 - Behavioral
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

entity top1 is
    Port ( clk : in std_logic;
           rst : in std_logic;
           data_in : in std_logic_vector(7 downto 0);
           data_out : out std_logic_vector(7 downto 0));
end top1;

architecture Behavioral of top1 is
begin
    process (clk, rst)
    begin
        if rst = '1' then
            data_out <= (others => '0')
        elsif rising_edge(clk) then
            data_out <= data_in;
        end if;
    end process;

end Behavioral;

