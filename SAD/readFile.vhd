----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:43:57 09/30/2014 
-- Design Name: 
-- Module Name:    readFile - Behavioral 
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
use IEEE.STD_LOGIC_TEXTIO.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity readFile is
	generic(
		aFile: string := "matA.txt";
		bFile: string := "matB.txt"
	);
	port(
		CLK : in std_logic;
		RST : in std_logic;
		S : out std_logic_vector (4 downto 0);
		EOG : out std_logic;
	);
end readFile;

architecture Behavioral of readFile is

file inAFile: TEXT open read_mode is aFile;
file inBFile: TEXT open read_mode is bFile;

signal strA, strB: string(0 to 3);
signal lineA, lineB: line;

begin

	for i in 1 to WIDTH loop
		for j in 1 to HEIGHT loop
			matA(i,j) <= (OTHERS => '0');
			matB(i,j) <= (OTHERS => '0');

	for i in 1 to WIDTH loop
		for j in 1 to HEIGHT loop
			if(not endfile(aFile) and not endfile(bFile) then
				readline(aFile, lineA);
				readline(bFile, lineB);
				read(lineA, strA);
				read(lineB, strB);
				matA(i,j) <= to_std_logic_vector(strA);
				matB(i,j) <= to_std_logic_vector(strB);
			end if;
		end loop;
	end loop;

end Behavioral;