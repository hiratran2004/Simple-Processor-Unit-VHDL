module Lab6 (
input CLOCK_50,
input [9:0] SW,
input [0:0] KEY,
output [9:0] LEDR
);

wire CLK,temp;

REG1 run(.q(temp),.data(run),.en(1),.rst(KEY[0]),.clk(CLOCK_50));

HZ10 dut1(.CLKin(CLOCK_50),.CLKout(CLK));

ENHANCED_PROC dut (.CLK(CLK),.RUN(temp),.RST(KEY[0]),.DONE(LEDR[9]),.DOUT(0),.ADDR(0),.W(0),.R0(0),.R1(0),.R2(0),.R3(0),.R4(0),.R5(0),.R6(0),.R7(0),.IR(0),.BUS(0),.STATE(0),.DIN(0),.A(0),.G(0),.LEDS(LEDR[8:0]));

endmodule 