module xor_gate(c,a,b);
input a,b;
output wire c;

logic f1,f2;

assign f1 = ~(a&b);
assign f2 = a|b;
assign c = f1 & f2;

endmodule 
