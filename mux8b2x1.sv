module mux8b2x1 (OUT, IN0, IN1, SEL);
input SEL;
input [7:0] IN0, IN1;
output wire [7:0] OUT;

mux1b2x1 mux0(.out(OUT[0]),.sel(SEL),.in0(IN0[0]),.in1(IN1[0]));
mux1b2x1 mux1(.out(OUT[1]),.sel(SEL),.in0(IN0[1]),.in1(IN1[1]));
mux1b2x1 mux2(.out(OUT[2]),.sel(SEL),.in0(IN0[2]),.in1(IN1[2]));
mux1b2x1 mux3(.out(OUT[3]),.sel(SEL),.in0(IN0[3]),.in1(IN1[3]));

mux1b2x1 mux4(.out(OUT[4]),.sel(SEL),.in0(IN0[4]),.in1(IN1[4]));
mux1b2x1 mux5(.out(OUT[5]),.sel(SEL),.in0(IN0[5]),.in1(IN1[5]));
mux1b2x1 mux6(.out(OUT[6]),.sel(SEL),.in0(IN0[6]),.in1(IN1[6]));
mux1b2x1 mux7(.out(OUT[7]),.sel(SEL),.in0(IN0[7]),.in1(IN1[7]));

endmodule
