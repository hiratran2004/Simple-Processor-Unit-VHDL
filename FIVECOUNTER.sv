module FIVECOUNTER(CLK,Q);
input CLK;
output [4:0] Q;

wire [3:0] temp;

REG1 R0(.q(Q[0]),.data(~Q[0]),.clk(CLK),.en(1),.rst(1));
REG1 R1(.q(Q[1]),.data(~Q[1]),.clk(~Q[0]),.en(1),.rst(1));
REG1 R2(.q(Q[2]),.data(~Q[2]),.clk(~Q[1]),.en(1),.rst(1));
REG1 R3(.q(Q[3]),.data(~Q[3]),.clk(~Q[2]),.en(1),.rst(1));
REG1 R4(.q(Q[4]),.data(~Q[4]),.clk(~Q[3]),.en(1),.rst(1));

endmodule 
