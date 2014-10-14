--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;

package teste2 is
function log2_unsigned (  x :  natural ) return natural;
function string_to_int(x_str : string; radix : positive range 2 to 36 := 10) return integer;

constant WIDTH : integer := 4;
constant HEIGHT : integer := 4;
constant TOTAL: integer := WIDTH*HEIGHT;
constant HALF_TOTAL : integer := TOTAL/2;
constant QUARTER_TOTAL : integer := HALF_TOTAL/2;
constant log2_total : natural := log2_unsigned(TOTAL);
type matrixSAD is array(0 to WIDTH-1, 0 to HEIGHT-1) of STD_LOGIC_VECTOR (7 downto 0);

-- type <new_type> is
--  record
--    <type_name>        : std_logic_vector( 7 downto 0);
--    <type_name>        : std_logic;
-- end record;
--
-- Declare constants
--
-- constant <constant_name>		: time := <time_unit> ns;
-- constant <constant_name>		: integer := <value;
--
-- Declare functions and procedure
--
-- function <function_name>  (signal <signal_name> : in <type_declaration>) return <type_declaration>;
-- procedure <procedure_name> (<type_declaration> <constant_name>	: in <type_declaration>);
--

end teste2;

package body teste2 is


function log2_unsigned ( x : natural ) return natural is
        variable temp : natural := x ;
        variable n : natural := 0 ;
    begin
        while temp > 1 loop
            temp := temp / 2 ;
            n := n + 1 ;
        end loop ;
        return n ;
    end function log2_unsigned ;

----------------------------------------------------------------------
  --Will take a string in the given radix and conver it to an integer
  ----------------------------------------------------------------------
  function string_to_int(x_str : string; radix : positive range 2 to 36 := 10) return integer is
    constant STR_LEN          : integer := x_str'length;
    
    variable chr_val          : integer;
    variable ret_int          : integer := 0;
    variable do_mult          : boolean := true;
    variable power            : integer := 0;
  begin
    
    for i in STR_LEN downto 1 loop
      case x_str(i) is
        when '0'       =>   chr_val := 0;
        when '1'       =>   chr_val := 1;
        when '2'       =>   chr_val := 2;
        when '3'       =>   chr_val := 3;
        when '4'       =>   chr_val := 4;
        when '5'       =>   chr_val := 5;
        when '6'       =>   chr_val := 6;
        when '7'       =>   chr_val := 7;
        when '8'       =>   chr_val := 8;
        when '9'       =>   chr_val := 9;
        when 'A' | 'a' =>   chr_val := 10;
        when 'B' | 'b' =>   chr_val := 11;
        when 'C' | 'c' =>   chr_val := 12;
        when 'D' | 'd' =>   chr_val := 13;
        when 'E' | 'e' =>   chr_val := 14;
        when 'F' | 'f' =>   chr_val := 15;
        when 'G' | 'g' =>   chr_val := 16;
        when 'H' | 'h' =>   chr_val := 17;
        when 'I' | 'i' =>   chr_val := 18;
        when 'J' | 'j' =>   chr_val := 19;
        when 'K' | 'k' =>   chr_val := 20;
        when 'L' | 'l' =>   chr_val := 21;
        when 'M' | 'm' =>   chr_val := 22;
        when 'N' | 'n' =>   chr_val := 23;
        when 'O' | 'o' =>   chr_val := 24;
        when 'P' | 'p' =>   chr_val := 25;
        when 'Q' | 'q' =>   chr_val := 26;
        when 'R' | 'r' =>   chr_val := 27;
        when 'S' | 's' =>   chr_val := 28;
        when 'T' | 't' =>   chr_val := 29;
        when 'U' | 'u' =>   chr_val := 30;
        when 'V' | 'v' =>   chr_val := 31;
        when 'W' | 'w' =>   chr_val := 32;
        when 'X' | 'x' =>   chr_val := 33;
        when 'Y' | 'y' =>   chr_val := 34;
        when 'Z' | 'z' =>   chr_val := 35;                           
        when '-' =>   
          if i /= 1 then
            report "Minus sign must be at the front of the string" severity failure;
          else
            ret_int           := 0 - ret_int;
            chr_val           := 0;
            do_mult           := false;    --Minus sign - do not do any number manipulation
          end if;
                     
        when others => report "Illegal character for conversion for string to integer" severity failure;
      end case;
      
      if chr_val >= radix then report "Illagel character at this radix" severity failure; end if;
        
      if do_mult then
        ret_int               := ret_int + (chr_val * (radix**power));
      end if;
        
      power                   := power + 1;
          
    end loop;
    
    return ret_int;
    
  end function;
  
  
---- Example 1
--  function <function_name>  (signal <signal_name> : in <type_declaration>  ) return <type_declaration> is
--    variable <variable_name>     : <type_declaration>;
--  begin
--    <variable_name> := <signal_name> xor <signal_name>;
--    return <variable_name>; 
--  end <function_name>;

---- Example 2
--  function <function_name>  (signal <signal_name> : in <type_declaration>;
--                         signal <signal_name>   : in <type_declaration>  ) return <type_declaration> is
--  begin
--    if (<signal_name> = '1') then
--      return <signal_name>;
--    else
--      return 'Z';
--    end if;
--  end <function_name>;

---- Procedure Example
--  procedure <procedure_name>  (<type_declaration> <constant_name>  : in <type_declaration>) is
--    
--  begin
--    
--  end <procedure_name>;
 
end teste2;
