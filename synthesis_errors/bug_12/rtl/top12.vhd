----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.03.2024 16:20:08
-- Design Name: 
-- Module Name: singal_bit - Behavioral
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

--entity top12 is
----  Port ( );
--end singal_bit;

entity top12 is
	port (sel : in std_logic;
        out1 : out std_logic);
end entity;
architecture singal_bit of top12 is
    signal a : std_logic := "0";
    signal c : std_logic_vector (3 downto 0) := "0000";
begin
    out1 <= sel and a;
end singal_bit;
