--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:58:33 10/13/2014
-- Design Name:   
-- Module Name:   /home/brunno/Documents/vhdl/testelog2/testelogtb.vhd
-- Project Name:  testelog2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: testelog
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY testelogtb IS
END testelogtb;
 
ARCHITECTURE behavior OF testelogtb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT testelog
    PORT(
         A : IN  std_logic_vector(5 downto 0);
         S : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(5 downto 0) := "000000";

 	--Outputs
   signal S : std_logic_vector(5 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: testelog PORT MAP (
          A => A,
          S => S
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      A <= "010000";
		wait for 10 ns;
		A <= "001000";
		wait for 10 ns;
		A <= "100000";
		wait for 10 ns;
		A <= "000100";

      -- insert stimulus here 

      wait;
   end process;

END;
