----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.03.2024 05:23:01
-- Design Name: 
-- Module Name: CaseError - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top11 is
--  Port ( );
     port (
        sel : in std_logic_vector(1 downto 0);
        out1 : out std_logic
    );
end top11;

architecture Behavioral of top11 is

begin
    process(sel)
    begin
        case sel is
            when "00" =>
                out1 <= '1';
            when "01" =>
                out1 <= '0';
            when "10" =>
                out1 <= '0';
        end case;
    end process;

end Behavioral;
