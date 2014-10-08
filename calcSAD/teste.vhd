library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

package teste is
function log2_unsigned (  x :  natural ) return natural;

constant WIDTH : integer := 4;
constant HEIGHT : integer := 4;
constant TOTAL: integer := WIDTH*HEIGHT;
constant HALF_TOTAL : integer := 8;
constant QUARTER_TOTAL : integer := HALF_TOTAL/2;
constant log2_total : natural := log2_unsigned(TOTAL);
type matrixSAD is array(0 to WIDTH-1, 0 to HEIGHT-1) of STD_LOGIC_VECTOR (7 downto 0);

-- function somaSAD (in1, in2 : matrixSAD) return INTEGER;


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

end teste;

package body teste is


-- function somaSAD (in1, in2 : matrixSAD) return INTEGER is

-- begin

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

-- end function;

	
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
 
end teste;
