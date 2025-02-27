module REG4(Q,D,CLK,RST,EN);
input [3:0] D;
input CLK,EN,RST;
output wire [3:0] Q;

REG1 R0(.data(D[0]),.q(Q[0]),.clk(CLK),.en(EN),.rst(RST));
REG1 R1(.data(D[1]),.q(Q[1]),.clk(CLK),.en(EN),.rst(RST));
REG1 R2(.data(D[2]),.q(Q[2]),.clk(CLK),.en(EN),.rst(RST));
REG1 R3(.data(D[3]),.q(Q[3]),.clk(CLK),.en(EN),.rst(RST));

endmodule
