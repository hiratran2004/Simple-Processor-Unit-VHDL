module EXPDIFF(EXP_DIFF,EXP_A,EXP_B,F_EXP);

input [3:0] EXP_A,EXP_B;
output [3:0] F_EXP; 
output [4:0] EXP_DIFF;

logic temp_co ;
logic [4:0] temp_A,temp_B;

assign temp_A = {1'b0,EXP_A};
assign temp_B = {1'b0,EXP_B};

AS5 ALU1 (.A(temp_A),.B(temp_B),.Ci(1),.Co(temp_co),.S(EXP_DIFF));

mux4b2x1 mux1(.OUT(F_EXP),.IN0(EXP_A),.IN1(EXP_B),.SEL(EXP_DIFF[4]));

endmodule
