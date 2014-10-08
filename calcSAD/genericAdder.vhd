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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity genericAdder is
	generic(
				widthX : integer
	);
	port(
			a: in std_logic_vector(widthX-1 downto 0);
			b: in std_logic_vector(widthX-1 downto 0);
			c: out std_logic_vector(widthX downto 0)
	);
end genericAdder;

architecture Behavioral of genericAdder is

begin
	c(widthX-1 downto 0) <= a + b;

end Behavioral;