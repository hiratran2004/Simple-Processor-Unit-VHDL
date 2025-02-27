module demux1b1x2(out1,out2,in,sel);

input in,sel;
output out1,out2;

assign out1 = ~sel&in ;
assign out2 =  sel&in ;
 

endmodule
