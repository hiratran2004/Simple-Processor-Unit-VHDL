module mux4b2x1 (OUT, IN0, IN1, SEL);
input SEL;
input [3:0] IN0, IN1;
output wire [3:0] OUT;

mux1b2x1 mux0(.out(OUT[0]),.sel(SEL),.in0(IN0[0]),.in1(IN1[0]));
mux1b2x1 mux1(.out(OUT[1]),.sel(SEL),.in0(IN0[1]),.in1(IN1[1]));
mux1b2x1 mux2(.out(OUT[2]),.sel(SEL),.in0(IN0[2]),.in1(IN1[2]));
mux1b2x1 mux3(.out(OUT[3]),.sel(SEL),.in0(IN0[3]),.in1(IN1[3]));

endmodule
