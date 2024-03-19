entity Or4In is
	port(
		entry1, entry2, entry3, entry4: in bit;
		or_out: out bit
	);
end Or4In;

architecture behav of Or4In is

begin
	or_out <= entry1 or entry2 or entry3 or entry4;
	
end architecture behav;