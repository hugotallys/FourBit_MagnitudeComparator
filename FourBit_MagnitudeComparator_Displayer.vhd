LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY FourBit_MagnitudeComparator_Displayer IS
	PORT(
		numA_sel : IN std_logic_vector(3 DOWNTO 0);
		numB_sel : IN std_logic_vector(3 DOWNTO 0);
		hex0 : OUT std_logic_vector(6 DOWNTO 0);
		hex1 : OUT std_logic_vector(6 DOWNTO 0);
		hex2 : OUT std_logic_vector(6 DOWNTO 0);
		hex3 : OUT std_logic_vector(6 DOWNTO 0);
		hex4 : OUT std_logic_vector(6 DOWNTO 0);
		hex5 : OUT std_logic_vector(6 DOWNTO 0);
		hex6 : OUT std_logic_vector(6 DOWNTO 0);
		hex7 : OUT std_logic_vector(6 DOWNTO 0)	
	);
END FourBit_MagnitudeComparator_Displayer;

ARCHITECTURE Behavioral OF FourBit_MagnitudeComparator_Displayer IS
	COMPONENT BinaryDecimal_Decoder
		PORT ( 
			binary_input 	: IN std_logic_vector(3 DOWNTO 0);
			first_digit 	: OUT std_logic_vector(6 DOWNTO 0);
			second_digit 	: OUT std_logic_vector(6 DOWNTO 0)
		);
	END COMPONENT;

	SIGNAL binary_input1 	: std_logic_vector(3 DOWNTO 0) := (OTHERS => '0');
	SIGNAL first_digit1 		: std_logic_vector(6 DOWNTO 0);
	SIGNAL second_digit1 	: std_logic_vector(6 DOWNTO 0);

	SIGNAL binary_input2 	: std_logic_vector(3 DOWNTO 0) := (OTHERS => '0');
	SIGNAL first_digit2 		: std_logic_vector(6 DOWNTO 0);
	SIGNAL second_digit2 	: std_logic_vector(6 DOWNTO 0);
	
	COMPONENT Comparator
		PORT(
			A	: IN std_logic_vector(3 DOWNTO 0);
			B	: IN std_logic_vector(3 DOWNTO 0);
			A_less_B		: OUT std_logic;
			A_equals_B	: OUT std_logic; 
			A_greater_B	: OUT std_logic 
		);
	END COMPONENT;
	
	SIGNAL A 				: std_logic_vector(3 DOWNTO 0) := (OTHERS => '0');
   SIGNAL B 				: std_logic_vector(3 DOWNTO 0) := (OTHERS => '0');
   SIGNAL A_less_B 		: std_logic;
   SIGNAL A_equals_B 	: std_logic;
   SIGNAL A_greater_B 	: std_logic;
	
	COMPONENT BinaryChar_Decoder
		port(
			A_less_B_in : IN std_logic;
			A_equals_B_in : IN std_logic;
			A_greater_B_in : IN std_logic;
			char_display : OUT std_logic_vector(6 DOWNTO 0)
		);
	END COMPONENT;
	
	SIGNAL A_less_B_in 		: std_logic;
   SIGNAL A_equals_B_in 	: std_logic;
   SIGNAL A_greater_B_in 	: std_logic;
	SIGNAL char_display 		: std_logic_vector(6 DOWNTO 0);
	
	BEGIN
		hex7_and_6_displayer : BinaryDecimal_Decoder PORT MAP(
			binary_input => binary_input1,
			first_digit => first_digit1,
			second_digit => second_digit1
		);
		
		hex5_and_4_displayer : BinaryDecimal_Decoder PORT MAP(
			binary_input => binary_input2,
			first_digit => first_digit2,
			second_digit => second_digit2
		);
		
		input_comparator : Comparator PORT MAP(
			A => A,
			B => B,
			A_less_B => A_less_B,
			A_equals_B => A_equals_B,
			A_greater_B => A_greater_B
		);
		
		hex0_to_3_displayer : BinaryChar_Decoder PORT MAP(
			A_less_B_in => A_less_B_in,
			A_equals_B_in => A_equals_B_in,
			A_greater_B_in => A_greater_B_in,
			char_display => char_display
		);
		
		binary_input1 <= numA_sel;
		hex7 <= second_digit1;
		hex6 <= first_digit1;
		
		binary_input2 <= numB_sel;
		hex5 <= second_digit2;
		hex4 <= first_digit2;
		
		A <= numA_sel;
		B <= numB_sel;
		
		A_less_B_in <= A_less_B;
		A_equals_B_in <= A_equals_B;
		A_greater_B_in <= A_greater_B;
		
		hex0 <= char_display;
		hex1 <= char_display;
		hex2 <= char_display;
		hex3 <= char_display;	
END Behavioral;