LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY Comparator IS
	PORT(
		A	: IN std_logic_vector(3 DOWNTO 0);
		B	: IN std_logic_vector(3 DOWNTO 0);
		A_less_B		: OUT std_logic;
		A_equals_B	: OUT std_logic;
		A_greater_B	: OUT std_logic
	);
END Comparator;

ARCHITECTURE Comparator_behavior OF Comparator IS
	SIGNAL aux1, aux2, aux3, aux4 : std_logic;
	SIGNAL aux5, aux6, aux7, aux8 : std_logic;
	SIGNAL aux9, aux10, aux11, aux12 : std_logic;
	
	BEGIN
		aux9 <= (not A(3)) and B(3);
		aux10 <= (A(3) xnor B(3)) and (not A(2)) and B(2);
		aux11 <= (A(3) xnor B(3)) and (A(2) xnor B(2)) and (not A(1)) and B(1);
		aux12 <= (A(3) xnor B(3)) and (A(2) xnor B(2)) and (A(1) xnor B(1)) and (not A(0)) and B(0);
		A_less_B <= aux9 or aux10 or aux11 or aux12;
		
		aux5 <= A(3) xnor B(3);
		aux6 <= A(2) xnor B(2);
		aux7 <= A(1) xnor B(1);
		aux8 <= A(0) xnor B(0);
		A_equals_B <= aux5 and aux6 and aux7 and aux8;
		
		aux1 <= A(3) and (not B(3));
		aux2 <= (A(3) xnor B(3)) and A(2) and (not B(2));
		aux3 <= (A(3) xnor B(3)) and (A(2) xnor B(2)) and A(1) and (not B(1));
		aux4 <= (A(3) xnor B(3)) and (A(2) xnor B(2)) and (A(1) xnor B(1)) and A(0) and (not B(0));
		A_greater_B <= aux1 or aux2 or aux3 or aux4;
END Comparator_behavior;