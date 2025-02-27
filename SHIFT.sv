module SHIFT(EXP_DIFF,S_FRAC,SHIFT_FRAC);

input [4:0] EXP_DIFF;
input [3:0] S_FRAC;
output[5:0] SHIFT_FRAC;

wire [5:0] temp, tempS;

AS5 ifneg(.A(5'b00000),.B(EXP_DIFF),.Ci(EXP_DIFF[4]),.Co(0),.S(tempS));

assign temp = {1'b1, S_FRAC, 1'b0};

mux1b8x1 mux0(.out(SHIFT_FRAC[0]),.in0(temp[0]),.in1(temp[1]),.in2(temp[2]),.in3(temp[3]),.in4(temp[4]),.in5(temp[5]),.in6(0),.in7(0),.sel(tempS[2:0]));
mux1b8x1 mux1(.out(SHIFT_FRAC[1]),.in0(temp[1]),.in1(temp[2]),.in2(temp[3]),.in3(temp[4]),.in4(temp[5]),.in5(0),.in6(0),.in7(0),.sel(tempS[2:0]));
mux1b8x1 mux2(.out(SHIFT_FRAC[2]),.in0(temp[2]),.in1(temp[3]),.in2(temp[4]),.in3(temp[5]),.in4(0),.in5(0),.in6(0),.in7(0),.sel(tempS[2:0]));
mux1b8x1 mux3(.out(SHIFT_FRAC[3]),.in0(temp[3]),.in1(temp[4]),.in2(temp[5]),.in3(0),.in4(0),.in5(0),.in6(0),.in7(0),.sel(tempS[2:0]));
mux1b8x1 mux4(.out(SHIFT_FRAC[4]),.in0(temp[4]),.in1(temp[5]),.in2(0),.in3(0),.in4(0),.in5(0),.in6(0),.in7(0),.sel(tempS[2:0]));
mux1b8x1 mux5(.out(SHIFT_FRAC[5]),.in0(temp[5]),.in1(0),.in2(0),.in3(0),.in4(0),.in5(0),.in6(0),.in7(0),.sel(tempS[2:0]));

endmodule
