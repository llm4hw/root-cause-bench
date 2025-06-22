----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.03.2024 01:20:40
-- Design Name: 
-- Module Name: type_conversion - Behavioral
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top5 is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           out1 : out STD_LOGIC);
end top5;

architecture Behavioral of top5 is
    signal counter : integer range 0 to 255 := 0;

begin
    process (clk, rst)
    begin
        if rst = '1' then
            counter <= 0;
        elsif rising_edge(clk) then
            if counter < 255 then
                counter <= counter + 1;
            end if;
        end if;
    end process;
    out1 <= std_logic_vector(to_unsigned(counter, 8))(7);

end Behavioral;
