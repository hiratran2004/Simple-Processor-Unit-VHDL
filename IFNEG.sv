module IFNEG(SIGN,IN,OUT,OUT1);
input SIGN;
input [3:0] IN;
output [3:0] OUT; 
output [5:0] OUT1;

wire Co;

AS4 A1(.A(4'b0000),.B(IN),.Ci(SIGN),.Co(Co),.S(OUT));

assign OUT1 = {SIGN,1'b1,IN};
 
 
endmodule
