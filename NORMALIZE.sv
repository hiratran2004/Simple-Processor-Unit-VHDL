module NORMALIZE(TEMP_FRAC,FIN_EXP,RESULT_FRAC,RESULT_EXP);
 
input[6:0] TEMP_FRAC;
input[3:0] FIN_EXP;

output[3:0] RESULT_FRAC,RESULT_EXP;


wire [2:0] temp0,temp1,temp2,temp3,temp4,right_shift_amount;
wire [3:0] ADDED_EXP;
wire [6:0] temp_frac_result1, temp_frac_result2;

mux3b2x1 mux0(.OUT(right_shift_amount),.IN0(temp0),.IN1(3'b000),.SEL(TEMP_FRAC[5]));
mux3b2x1 mux1(.OUT(temp0),.IN0(temp1),.IN1(3'b001),.SEL(TEMP_FRAC[4]));
mux3b2x1 mux2(.OUT(temp1),.IN0(temp2),.IN1(3'b010),.SEL(TEMP_FRAC[3]));
mux3b2x1 mux3(.OUT(temp2),.IN0(temp3),.IN1(3'b011),.SEL(TEMP_FRAC[2]));
mux3b2x1 mux4(.OUT(temp3),.IN0(temp4),.IN1(3'b100),.SEL(TEMP_FRAC[1]));
mux3b2x1 mux5(.OUT(temp4),.IN0(3'b000),.IN1(3'b101),.SEL(TEMP_FRAC[0]));
 
mux1b8x1 mux6(.out(temp_frac_result1[0]),.in0(TEMP_FRAC[0]),.in1(0),				 .in2(0),			  .in3(0),			   .in4(0),				 .in5(0),			  .in6(0),           .in7(0),	.sel(right_shift_amount));
mux1b8x1 mux7(.out(temp_frac_result1[1]),.in0(TEMP_FRAC[1]),.in1(TEMP_FRAC[0]),.in2(0),			  .in3(0),			   .in4(0),				 .in5(0),			  .in6(0),           .in7(0),	.sel(right_shift_amount));
mux1b8x1 mux8(.out(temp_frac_result1[2]),.in0(TEMP_FRAC[2]),.in1(TEMP_FRAC[1]),.in2(TEMP_FRAC[0]),.in3(0),			   .in4(0),				 .in5(0),			  .in6(0),           .in7(0),	.sel(right_shift_amount));
mux1b8x1 mux9(.out(temp_frac_result1[3]),.in0(TEMP_FRAC[3]),.in1(TEMP_FRAC[2]),.in2(TEMP_FRAC[1]),.in3(TEMP_FRAC[0]),.in4(0),				 .in5(0),			  .in6(0),           .in7(0),	.sel(right_shift_amount));
mux1b8x1 muxa(.out(temp_frac_result1[4]),.in0(TEMP_FRAC[4]),.in1(TEMP_FRAC[3]),.in2(TEMP_FRAC[2]),.in3(TEMP_FRAC[1]),.in4(TEMP_FRAC[0]),.in5(0),			  .in6(0),           .in7(0),	.sel(right_shift_amount));
mux1b8x1 muxb(.out(temp_frac_result1[5]),.in0(TEMP_FRAC[5]),.in1(TEMP_FRAC[4]),.in2(TEMP_FRAC[3]),.in3(TEMP_FRAC[2]),.in4(TEMP_FRAC[1]),.in5(TEMP_FRAC[0]),.in6(0),           .in7(0),	.sel(right_shift_amount));
mux1b8x1 muxc(.out(temp_frac_result1[6]),.in0(TEMP_FRAC[6]),.in1(TEMP_FRAC[5]),.in2(TEMP_FRAC[4]),.in3(TEMP_FRAC[3]),.in4(TEMP_FRAC[2]),.in5(TEMP_FRAC[1]),.in6(TEMP_FRAC[1]),.in7(0),	.sel(right_shift_amount));

assign temp_frac_result2 = {1'b0,TEMP_FRAC[6:1]};

mux4b2x1 re_frac(.OUT(RESULT_FRAC),.IN0(temp_frac_result1[4:1]),.IN1(temp_frac_result2[4:1]),.SEL(TEMP_FRAC[6])); 

AS4 ALU1(.A(FIN_EXP),.B(4'b0001),.Ci(~TEMP_FRAC[6]),.Co(0),.S(ADDED_EXP));                                                                                                                                                                                                                                                                                                                                                                                                
mux4b2x1 re_exp (.OUT(RESULT_EXP),.IN0(ADDED_EXP),.IN1(FIN_EXP),.SEL(TEMP_FRAC[5]&~TEMP_FRAC[6]));
			                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       							
endmodule
							 
							
						
		