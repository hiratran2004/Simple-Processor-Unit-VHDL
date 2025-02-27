module SHIFTBIT (IN,OUT,CLK,RST,SHIFT_LOAD,EN);

input [5:0] IN;
input CLK,RST,SHIFT_LOAD,EN;
output [5:0] OUT ;

wire [5:0] temp; 

mux1b2x1 mux5(.in1 (IN[5]),.in2 (0),.out (temp[5]),.sel (SHIFT_LOAD));

REG1 r0 (.data(temp[5]),.q(OUT[5]),.clk(CLK),.rst(RST),.en(EN));
mux1b2x1 mux0(.in1 (IN[4]),.in2 (OUT[5]),.out (temp[0]),.sel (SHIFT_LOAD));

REG1 r1 (.data(temp[0]),.q(OUT[4]),.clk(CLK),.rst(RST),.en(EN));
mux1b2x1 mux1(.in1 (IN[3]),.in2 (OUT[4]),.out (temp[1]),.sel (SHIFT_LOAD));

REG1 r2 (.data(temp[1]),.q(OUT[3]),.clk(CLK),.rst(RST),.en(EN));
mux1b2x1 mux2(.in1 (IN[2]),.in2 (OUT[3]),.out (temp[2]),.sel (SHIFT_LOAD));

REG1 r3 (.data(temp[2]),.q(OUT[2]),.clk(CLK),.rst(RST),.en(EN));
mux1b2x1 mux3(.in1 (IN[1]),.in2 (OUT[2]),.out (temp[3]),.sel (SHIFT_LOAD));

REG1 r4 (.data(temp[3]),.q(OUT[1]),.clk(CLK),.rst(RST),.en(EN));
mux1b2x1 mux4(.in1 (IN[0]),.in2 (OUT[1]),.out (temp[4]),.sel (SHIFT_LOAD));

REG1 r5 (.data(temp[4]),.q(OUT[0]),.clk(CLK),.rst(RST),.en(EN));

endmodule 
