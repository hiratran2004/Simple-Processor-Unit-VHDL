module mux1b2x1 (out,in0,in1,sel);
input in0,in1,sel;
output wire out;

logic f1,f2;

assign f1 = in1 & sel ;
assign f2 = in0 & (~sel);
assign out = f1 | f2; 

endmodule 
