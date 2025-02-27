module FRAC(EXP_DIFF,FRAC_A,FRAC_B,S_FRAC,L_FRAC,SIGN_A,SIGN_B,S_SIGN,L_SIGN,OPPERAND);

input [3:0] FRAC_A,FRAC_B;
input [4:0] EXP_DIFF;
input SIGN_A,SIGN_B;

output wire S_SIGN,L_SIGN,OPPERAND;
output wire [3:0] S_FRAC,L_FRAC; 

wire [4:0] temp,temp_A,temp_B;
wire [3:0] OUT1,OUT2,OUT3,OUT4;
wire OUT5,OUT6,OUT7,OUT8;
wire Co,zero,opperand_check;

assign temp_A = {1'b0,FRAC_A};
assign temp_B = {1'b0,FRAC_B};

assign zero = ~(EXP_DIFF[0]|EXP_DIFF[1]|EXP_DIFF[2]|EXP_DIFF[3]|EXP_DIFF[4]);
assign opperand_check = (S_SIGN == SIGN_B )? (S_FRAC == FRAC_B)? (FRAC_A != FRAC_B)? 1'b1: (EXP_DIFF[4] == 1'b1)? 1'b0 : 1'b1 : 1'b0 : 1'b0  ;
 
AS5 ALU (.A(temp_A),.B(temp_B),.Ci(1),.S(temp),.Co(Co));

mux4b2x1 mux1(.SEL(temp[4]),.IN0(FRAC_B),.IN1(FRAC_A),.OUT(OUT1));
mux4b2x1 mux2(.SEL(EXP_DIFF[4]),.IN0(FRAC_B),.IN1(FRAC_A),.OUT(OUT2));
mux4b2x1 mux3(.SEL(zero),.IN0(OUT2),.IN1(OUT1),.OUT(S_FRAC));

mux4b2x1 mux4(.SEL(temp[4]),.IN0(FRAC_A),.IN1(FRAC_B),.OUT(OUT3));
mux4b2x1 mux5(.SEL(EXP_DIFF[4]),.IN0(FRAC_A),.IN1(FRAC_B),.OUT(OUT4));
mux4b2x1 mux6(.SEL(zero),.IN0(OUT4),.IN1(OUT3),.OUT(L_FRAC));

mux1b2x1 mux7(.sel(temp[4]),.in0(SIGN_A),.in1(SIGN_B),.out(OUT5));
mux1b2x1 mux8(.sel(EXP_DIFF[4]),.in0(SIGN_A),.in1(SIGN_B),.out(OUT6));
mux1b2x1 mux9(.sel(zero),.in0(OUT6),.in1(OUT5),.out(L_SIGN));

mux1b2x1 mux10(.sel(temp[4]),.in0(SIGN_B),.in1(SIGN_A),.out(OUT7));
mux1b2x1 mux11(.sel(EXP_DIFF[4]),.in0(SIGN_B),.in1(SIGN_A),.out(OUT8));
mux1b2x1 mux12(.sel(zero),.in0(OUT8),.in1(OUT7),.out(S_SIGN));

mux1b2x1 mux13(.sel(opperand_check),.in0(1'b0),.in1(1'b1),.out(OPPERAND));
 
 
endmodule
