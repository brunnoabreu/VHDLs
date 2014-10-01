-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;
  USE ieee.std_logic_textio.ALL;

  ENTITY testbench IS
  	generic(
		aFile: string := "matA.txt";
		bFile: string := "matB.txt"
	);
	port(
		CLK : in std_logic;
		RST : in std_logic;
		S : out std_logic_vector (4 downto 0);
	);
  END testbench;

  ARCHITECTURE behavior OF testbench IS 

  -- Component Declaration
          COMPONENT calcSAD
          PORT(
					matA : in matrixSAD;
					matB : in matrixSAD;
					en : in std_logic;
					S   : out integer
                  );
          END COMPONENT;

          SIGNAL matA, matB : matrixSAD;
          SIGNAL en :  std_logic;
			 SIGNAL S : integer;
			 
			 
			 -- File setup
			 file inAFile: TEXT open read_mode is aFile;
			 file inBFile: TEXT open read_mode is bFile;

			 signal strA, strB: string(0 to 3);
			 signal lineA, lineB: line;

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
     BEGIN
	  
	  en <= '0';
	  
	 -- ZERA MATRIZ
			for i in 1 to WIDTH loop
				for j in 1 to HEIGHT loop
					matA(i,j) <= (OTHERS => '0');
					matB(i,j) <= (OTHERS => '0');
				end loop;
			end loop;
			
	-- ESCREVE DOS ARQUIVOS PARA AS MATRIZES DE ENTRADA
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
			
		en <= '1';
			
			
        wait; -- will wait forever
     END PROCESS tb;
  --  End Test Bench 

  END;
