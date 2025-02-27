`timescale 1ns/1ps
module tb_FPU ();

reg ADDSUB,ZERO;
reg [8:0] A,B,S;

FPU dut(.A(A),.B(B),.S(S),.ADDSUB(ADDSUB),.ZERO(ZERO));

initial begin

#1 ADDSUB <= 0; A <= 9'b001010000; B <= 9'b001000000;

#1 ADDSUB <= 1; A <= 9'b000010000; B <= 9'b000010000;

#1 ADDSUB <= 1; A <= 9'b001110000; B <= 9'b001111000;

#1 ADDSUB <= 1; A <= 9'b010111100; B <= 9'b001111000;

#1 ADDSUB <= 1; A <= 9'b010111100; B <= 9'b001111000;

$stop;
$finish;


end

endmodule
