`timescale 1ns/1ps
module tb_ENHANCED_PROC ();

reg CLK,RUN,RST,DONE,W;
reg [8:0] R0,R1,R2,R3,R4,R5,R6,R7,ADDR,DOUT,IR,BUS,DIN,A,G,LEDS;
reg [3:0] STATE;

ENHANCED_PROC dut (.CLK(CLK),.RUN(RUN),.RST(RST),.DONE(DONE),.DOUT(DOUT),.ADDR(ADDR),.W(W),.R0(R0),.R1(R1),.R2(R2),.R3(R3),.R4(R4),.R5(R5),.R6(R6),.R7(R7),.IR(IR),.BUS(BUS),.STATE(STATE),.DIN(DIN),.A(A),.G(G),.LEDS(LEDS));
initial begin

RUN <= 1; 
RST <= 1;

repeat(50) begin

#1 CLK <= 0;
#1 CLK <= 1;

end

$stop;
$finish;


end

endmodule
