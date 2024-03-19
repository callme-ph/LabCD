entity And2In is
	port(
		in1, in2: in bit;
		and_out: out bit
	);
end And2In;
	
-- Behav
architecture behav of And2In is 

begin
	and_out <= in1 and in2;
	
end architecture behav;