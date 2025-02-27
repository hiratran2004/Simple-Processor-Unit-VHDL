module FA1(
	input logic a,b,ci,
	output wire s,co	
);

logic f1, f2, f3;

xor (f1, a, b);
and (f2, a, b);
and (f3, ci, f1);

xor (s, ci, f1);
or (co, f2, f3);

endmodule
