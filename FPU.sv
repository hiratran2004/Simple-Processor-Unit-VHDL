module FPU (A,B,S,ADDSUB,ZERO);
input [8:0] A,B;
input ADDSUB;

output [8:0] S;
output ZERO;

wire [3:0] F_EXP,L_FRAC;
wire [6:0] TEMP_FRAC;
wire [5:0] SHIFT_FRAC;

wire [5:0] LARGER_FRAC;
wire [4:0] EXP_DIFF;
wire [3:0] S_FRAC,RESULT_EXP,RESULT_FRAC;
wire L_SIGN,S_SIGN,RESULT_SIGN,OPPERAND;

assign ZERO = ((A[7:0] == B[7:0])&((A[8] != B[8])&(ADDSUB == 0) ||(A[8] == B[8])&(ADDSUB == 1)))? 1'b0 : 1'b1;

EXPDIFF   dut1(.EXP_DIFF(EXP_DIFF),.EXP_A(A[7:4]),.EXP_B(B[7:4]),.F_EXP(F_EXP));
FRAC      dut2(.EXP_DIFF(EXP_DIFF),.FRAC_A(A[3:0]),.FRAC_B(B[3:0]),.S_FRAC(S_FRAC),.L_FRAC(L_FRAC),.SIGN_A(A[8]),.SIGN_B(B[8]),.S_SIGN(S_SIGN),.L_SIGN(L_SIGN),.OPPERAND(OPPERAND));
SHIFT     dut5(.EXP_DIFF(EXP_DIFF),.S_FRAC(S_FRAC),.SHIFT_FRAC(SHIFT_FRAC));

assign LARGER_FRAC = {1'b1,L_FRAC,1'b0};

FRAC_ALU  dut3(.SHIFT_FRAC(SHIFT_FRAC),.LARGER_FRAC(LARGER_FRAC),.ADDSUB(ADDSUB),.TEMP_FRAC(TEMP_FRAC),.RESULT_SIGN(RESULT_SIGN), .L_SIGN(L_SIGN), .S_SIGN(S_SIGN),.OPPERAND(OPPERAND));
NORMALIZE dut4(.TEMP_FRAC(TEMP_FRAC),.FIN_EXP(F_EXP),.RESULT_FRAC(RESULT_FRAC),.RESULT_EXP(RESULT_EXP));


assign S = {RESULT_SIGN,RESULT_EXP,RESULT_FRAC}&{9{ZERO}};
 

endmodule