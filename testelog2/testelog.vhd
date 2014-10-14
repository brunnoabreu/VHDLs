----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:54:15 10/13/2014 
-- Design Name: 
-- Module Name:    testelog - Behavioral 
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
use IEEE.numeric_std.ALL;
use work.testando.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity testelog is
    Port ( A : in  std_logic_vector(5 downto 0);
           S : out  std_logic_vector(5 downto 0));
end testelog;

architecture Behavioral of testelog is

begin

	S <= std_logic_vector(to_unsigned(log2_unsigned(to_integer(unsigned(A))), S'length));

end Behavioral;

