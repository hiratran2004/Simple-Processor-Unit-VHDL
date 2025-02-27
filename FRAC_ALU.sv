module FRAC_ALU(SHIFT_FRAC,LARGER_FRAC,ADDSUB,TEMP_FRAC,RESULT_SIGN, L_SIGN, S_SIGN,OPPERAND);

input [5:0] SHIFT_FRAC,LARGER_FRAC;
input ADDSUB, L_SIGN, S_SIGN, OPPERAND;

output [6:0] TEMP_FRAC;
output RESULT_SIGN;

wire [7:0] temp1,temp2,temp1_out,temp2_out,alu_in1,alu_in2,alu_out;

assign temp2 = {2'b00,SHIFT_FRAC};
assign temp1 = {2'b00,LARGER_FRAC};

AS8 if_neg1(.A(8'b00000000),.B(temp1),.S(temp1_out),.Co(0),.Ci(L_SIGN));
AS8 if_neg2(.A(8'b00000000),.B(temp2),.S(temp2_out),.Co(0),.Ci(S_SIGN));

mux8b2x1 mux0(.OUT(alu_in2),.IN0(temp1_out),.IN1(temp2_out),.SEL(OPPERAND));
mux8b2x1 mux1(.OUT(alu_in1),.IN0(temp1_out),.IN1(temp2_out),.SEL(~OPPERAND));


AS8 ALU(.A(alu_in1),.B(alu_in2),.Ci(ADDSUB),.Co(0),.S(alu_out));

assign RESULT_SIGN = alu_out[7];

AS7 if_neg3(.A(7'b0000000),.B(alu_out[6:0]),.S(TEMP_FRAC),.Co(0),.Ci(alu_out[7]));

endmodule