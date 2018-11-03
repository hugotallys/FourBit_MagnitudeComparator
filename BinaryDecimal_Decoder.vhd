LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY BinaryDecimal_Decoder IS
	PORT(
		binary_input	: IN std_logic_vector(3 DOWNTO 0);
		first_digit		: OUT std_logic_vector(6 DOWNTO 0);
		second_digit	: OUT std_logic_vector(6 DOWNTO 0)
	);
END BinaryDecimal_Decoder;

ARCHITECTURE BinaryDecimal_Decoder_Behavior OF BinaryDecimal_Decoder IS
	SIGNAL A, B, C, D : std_logic;
	BEGIN
	A <= binary_input(0);
	B <= binary_input(1);
	C <= binary_input(2);
	D <= binary_input(3);
	
	first_digit(0) <= ((not A) and (not B) and (not C) and D) or ((not A) and B and (not C) and (not D)) or (A and (not B) and C and D) or (A and B and C and (not D));
	first_digit(1) <= ((not A) and B and (not C) and D) or ((not A) and B and C and (not D)) or (A and B and C and D);
	first_digit(2) <= ((not A) and (not B) and C and (not D)) or (A and B and (not C) and (not D));
	first_digit(3) <= ((not A) and (not B) and (not C) and D) or ((not A) and B and (not C) and (not D)) or ((not A) and B and C and D) or (A and (not B) and C and D) or(A and B and C and (not D));
	first_digit(4) <= D or ((not A) and B and (not C)) or (A and B and C);
	first_digit(5) <= (B and (not D)) or (B and (not C)) or ((not A) and (not B) and D) or ((not A) and (not B) and C) or (A and C and D);
	first_digit(6) <= ((not A) and (not B) and (not C)) or (A and (not B) and C) or ((not A) and B and C and D);
	
	second_digit(0) <= (A and C) or (A and B);
	second_digit(1) <= '0';
	second_digit(2) <= '0';
	second_digit(3) <= (A and C) or (A and B);
	second_digit(4) <= (A and C) or (A and B);
	second_digit(5) <= (A and C) or (A and B);
	second_digit(6) <= '1';

END BinaryDecimal_Decoder_Behavior;