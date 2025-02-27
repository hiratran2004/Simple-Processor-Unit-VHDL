module ENHANCED_PROC (CLK,RUN,RST,DONE,DOUT,ADDR,W,R0,R1,R2,R3,R4,R5,R6,R7,IR,BUS,STATE,DIN,A,G,LEDS);
input CLK,RST,RUN;

output [8:0] DOUT,ADDR,R0,R1,R2,R3,R4,R5,R6,R7,IR,BUS,DIN,A,G,LEDS;
output [3:0] STATE;
output W,DONE;

wire temp1,temp2; 

ENHANCEDPROCESSOR dut1(.RUN(RUN),.RST(RST),.CLK(CLK),.DIN(DIN),.DONE(DONE),.R0(R0),.R1(R1),.R2(R2),.R3(R3),.R4(R4),.R5(R5),.R6(R6),.R7(R7),.ADDR(ADDR),.DOUT(DOUT),.W(W),.IR(IR),.BUS(BUS),.STATE(STATE),.A(A),.G(G));

assign temp1 = ~(ADDR[8]|ADDR[7])&W;
assign temp2 = ~(ADDR[8]|~ADDR[7])&W;


RAMinit dut2(.CLK(CLK),.W(temp1),.DATAIN(DOUT),.DATAOUT(DIN),.ADDRESS(ADDR[6:0]));

REG dut3(.CLK(CLK),.RST(RST),.EN(temp2),.D(DOUT),.Q(LEDS));

endmodule 