entity And3In is
	port(
		in1, in2, in3: in bit;
		and_out: out bit
	);
end And3In;
	
-- Behav é somente um nome?
architecture behav of And3In is 

begin
	and_out <= in1 and in2 and in3;
	
end architecture behav;