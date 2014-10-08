----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:51:32 09/26/2014 
-- Design Name: 
-- Module Name:    calcSAD - Behavioral 
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
use IEEE.std_logic_arith.all;
use IEEE.numeric_std.ALL;
use work.teste.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity calcSAD is
	Port(
		matA : in matrixSAD;
		matB : in matrixSAD;
		en : in std_logic;
		S   : out std_logic_vector(8+log2_unsigned(TOTAL)-1 downto 0	));
end calcSAD;

architecture Behavioral of calcSAD is

component genericAdder is
	generic(
				widthX : integer
	);
	port(
			a: in std_logic_vector(widthX-1 downto 0);
			b: in std_logic_vector(widthX-1 downto 0);
			c: out std_logic_vector(widthX downto 0)
	);
end component;

component genericSub is
	port(
			a: in std_logic_vector(7 downto 0);
			b: in std_logic_vector(7 downto 0);
			c: out std_logic_vector(7 downto 0)
	);
end component;

-- type signalArray8b is array(0 to log2_unsigned(TOTAL)-1, 0 to TOTAL/2-1) of std_logic_vector(7+log2_unsigned(TOTAL)-1 downto 0); --0 to log2_unsigned(TOTAL)-1, 0 to TOTAL/2-1, 7+log2_unsigned(TOTAL)-1
type signalArray9b is array(0 to integer(log2_total)-1, 0 to TOTAL/2-1) of std_logic_vector(8+integer(log2_total)-1 downto 0); --0 to log2_unsigned(TOTAL)-1, 0 to TOTAL/2-1, 8+log2_unsigned(TOTAL)-1
type subArray is array(0 to TOTAL-1) of std_logic_vector (7 downto 0);

	signal subVec: subArray;
--	signal a, b: signalArray8b;
	signal c: signalArray9b;
	
begin

		gen0: for i in 0 to WIDTH-1 generate
			gen01: for j in 0 to HEIGHT-1 generate
				subX: genericSub
					port map(matA(i,j), matB(i,j), subVec(WIDTH*i+j));
			end generate gen01;
		end generate gen0;
						
						
	
		gen1: for i in 0 to (log2_total)-1 generate
			gen2: for j in 0 to (TOTAL/(2**(i+1)))-1 generate
				gen3: if i = 0 generate
					add0: genericAdder
						generic map( widthX => 8 + i)	port map(subVec(j), subVec(HALF_TOTAL+j), c(i,j)(8+i downto 0));
				end generate gen3;
				
				gen4: if i > 0 and i < (log2_total)-1 generate
					addx: genericAdder
						generic map( widthX => 8 + i)	port map(c(i-1,j)(8+i-1 downto 0), c(i-1,j+(HALF_TOTAL/(2**(i+1))))(8+i-1 downto 0), c(i,j)(8+i downto 0));					
				end generate gen4;
				
				gen5: if i = (log2_total)-1 generate
					addF: genericAdder
						generic map( widthX => 8 + i) port map(c(i-1,j)(8+i-1 downto 0), c(i-1, j+1)(8+i-1 downto 0), c(i,j)(8+i downto 0));
				end generate gen5;
			end generate gen2;
		end generate gen1;

		S <= (c((log2_total)-1, 0));
		

end Behavioral;

