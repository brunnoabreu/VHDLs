-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;
  library STD;
  use STD.textio.all;
  use work.teste2.all;

  ENTITY testbench IS
  END testbench;

  ARCHITECTURE behavior OF testbench IS 

  -- Component Declaration
          COMPONENT calcSAD
				Port(
					matA : in matrixSAD;
					matB : in matrixSAD;
					en   : in std_logic;
					S    : out std_logic_vector(8 + log2_total - 1 downto 0	));
				 END COMPONENT;

          SIGNAL matA :  matrixSAD;
			 SIGNAL matB :  matrixSAD;
			 SIGNAL en   :  std_logic;
          SIGNAL S :  std_logic_vector(8 + log2_total - 1 downto 0);
          

  BEGIN

  -- Component Instantiation
          uut: calcSAD PORT MAP(
                  matA => matA,
                  matB => matB,
						en => en,
						S => S
          );


  --  Test Bench Statements
     tb : PROCESS
	  
	     file file_pointerA : text;
		  file file_pointerB : text;
        variable line_content : string(1 to WIDTH*4 - 1);
        variable line_num : line;
		  variable i : integer := 1;
        variable a, b : integer := 0;
     
	  BEGIN

		 file_open(file_pointerA,"~/Documents/vhdl/matA.txt",READ_MODE);
		 while not endfile(file_pointerA) loop
			readline (file_pointerA,line_num);
			READ (line_num,line_content);
			while i < WIDTH loop
				matA(a,b) <= std_logic_vector(to_unsigned(string_to_int(line_content(i to i+2))));
				a := a + 1;
				i := i + 4;
			end loop;
			i := 0;
			a := 0;
			b := b + 1;
		end loop;
		file_close(file_pointerA);
		
		file_open(file_pointerB,"~/Documents/vhdl/matB.txt",READ_MODE);
		a := 0;
		b := 0;
		i := 0;
		while not endfile(file_pointerB) loop
			readline (file_pointerB,line_num);
			READ (line_num,line_content);
			while i < WIDTH loop
				matB(a,b) <= std_logic_vector(to_unsigned(string_to_int(line_content(i to i+2))));
				a := a + 1;
				i := i + 4;
			end loop;
			a := 0;
			b := b + 1;
		end loop;
		file_close(file_pointerB);

        wait; -- will wait forever
     END PROCESS tb;
  --  End Test Bench 

  END;
