----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:34:22 09/30/2014 
-- Design Name: 
-- Module Name:    genericAdder - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity genericAdder is
	generic(
				width : integer := 8;
				num : integer := 8
	);
	port(
			a: in array(0 to num-1) of std_logic_vector(width-1 downto 0);
			b: in array(0 to num-1) of std_logic_vector(width-1 downto 0);
			c: out array(0 to num-1) of std_logic_vector(width downto 0)
	);
end genericAdder;

architecture Behavioral of genericAdder is

begin
gen: for i in 0 to num generate
	c(i) <= a(i) + b(i);
end generate gen;

end Behavioral;

