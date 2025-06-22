----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.03.2024 23:05:57
-- Design Name: 
-- Module Name: PortDriverError - Behavioral
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
entity top10 is
    port (
        input1 :in std_logic;
        input2 : in std_logic;
        output : out std_logic
    );
end entity;

architecture rtl of top10 is
begin
    process(input1, input2)
    begin
        if (input1 = '0' and input2 = '0') then
            output <= '0';
        elsif (input1 = '1' and input2 = '1') then
            output <= '1';
        else
            -- Redundant assignment with overlapping conditions
            output <= '0';
        end if;
    end process;
end architecture;


