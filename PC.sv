module PC (IN,OUT,CLK,RST,INCR,PCin);

input [8:0] IN;
input CLK,RST,INCR,PCin;
output [8:0] OUT ;

wire [8:0] temp,temp_in;
logic Co;

mux9b2x1 MUX1(.IN0(IN),.IN1(temp_in),.OUT(temp),.SEL(INCR));
REG R1(.D(temp),.Q(OUT),.CLK(CLK),.RST(RST),.EN(PCin));
AS9 ALU1(.A(OUT),.B(9'b000000001),.Ci(0),.S(temp_in),.Co(Co));

endmodule 
