module COUNTERDOWN (IN,OUT,CLK,RST,LOAD_COUNT,EN);

input [3:0] IN;
input CLK,RST,LOAD_COUNT,EN;
output [3:0] OUT ;

wire [3:0] temp,temp_in;
logic Co;

mux4b2x1 MUX1(.IN1(IN),.IN2(temp_in),.OUT(temp),.SEL(LOAD_COUNT));
REG4 R1(.D(temp),.Q(OUT),.CLK(CLK),.RST(RST),.EN(EN));
AS4 ALU1(.A(OUT),.B(4'b0001),.Ci(1),.S(temp_in),.Co(Co));

endmodule 
