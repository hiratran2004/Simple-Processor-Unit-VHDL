module mux3b2x1 (OUT, IN0, IN1, SEL);
input SEL;
input [2:0] IN0, IN1;
output wire [2:0] OUT;

mux1b2x1 mux0(.out(OUT[0]),.sel(SEL),.in0(IN0[0]),.in1(IN1[0]));
mux1b2x1 mux1(.out(OUT[1]),.sel(SEL),.in0(IN0[1]),.in1(IN1[1]));
mux1b2x1 mux2(.out(OUT[2]),.sel(SEL),.in0(IN0[2]),.in1(IN1[2]));

endmodule
