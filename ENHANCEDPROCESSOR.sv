module ENHANCEDPROCESSOR(RUN,RST,CLK,DIN,DONE,R0,R1,R2,R3,R4,R5,R6,R7,ADDR,DOUT,W,IR,BUS,STATE,A,G); 

input RUN,RST,CLK;
input [8:0] DIN;

output DONE,W;
output [8:0] R0,R1,R2,R3,R4,R5,R6,R7,ADDR,DOUT,IR,BUS,A,G;
output [3:0] STATE;

wire IRin,Gout,DINout,Ain,ADDSUB,Gin,INCR,ADDRin,PCin,DOUTin,ZERO,AFPin,GFPin,GFPout;
wire [8:0] ALU,FPU,AFP,GFP;
wire [10:0] SEL;
wire [7:0] Rout,Rin;
logic co,wtemp;

assign SEL = {GFPout,Gout,DINout,Rout};
assign ZERO = (~G[0]&~G[1]&~G[2]&~G[3]&~G[4]&~G[5]&~G[6]&~G[7]&~G[8]);

MUX11x1 MUX(.IN10(GFP),.IN9(G),.IN8(DIN),.IN7(R7),.IN6(R6),.IN5(R5),.IN4(R4),.IN3(R3),.IN2(R2),.IN1(R1),.IN0(R0),.SEL(SEL),.OUT(BUS));

FSM CONTROL(.RUN(RUN),.RST(RST),.CLK(CLK),.IR(IR),.IRin(IRin),.Rout(Rout),.Rin(Rin),.Gout(Gout),.DINout(DINout),.Ain(Ain),.ADDSUB(ADDSUB),.Gin(Gin),.DONE(DONE),.INCR(INCR),.ADDRin(ADDRin),.W(wtemp),.PCin(PCin),.DOUTin(DOUTin),.STATE(STATE),.ZERO(ZERO),.AFPin(AFPin),.GFPin(GFPin),.GFPout(GFPout));

REG IRreg (.EN(IRin),.D(DIN),.Q(IR),.CLK(CLK),.RST(RST));

REG reg0 (.EN(Rin[0]),.D(BUS),.Q(R0),.CLK(CLK),.RST(RST));
REG reg1 (.EN(Rin[1]),.D(BUS),.Q(R1),.CLK(CLK),.RST(RST));
REG reg2 (.EN(Rin[2]),.D(BUS),.Q(R2),.CLK(CLK),.RST(RST));
REG reg3 (.EN(Rin[3]),.D(BUS),.Q(R3),.CLK(CLK),.RST(RST));
REG reg4 (.EN(Rin[4]),.D(BUS),.Q(R4),.CLK(CLK),.RST(RST));
REG reg5 (.EN(Rin[5]),.D(BUS),.Q(R5),.CLK(CLK),.RST(RST));
REG reg6 (.EN(Rin[6]),.D(BUS),.Q(R6),.CLK(CLK),.RST(RST));
PC  reg7 (.IN(BUS),.OUT(R7),.CLK(CLK),.RST(RST),.INCR(INCR),.PCin(PCin));

REG Areg  (.EN(Ain),.D(BUS),.Q(A),.CLK(CLK),.RST(RST));
 
REG Greg  (.EN(Gin),.D(ALU),.Q(G),.CLK(CLK),.RST(RST));

REG Dout  (.EN(DOUTin),.D(BUS),.Q(DOUT),.CLK(CLK),.RST(RST));

REG address (.EN(ADDRin),.D(BUS),.Q(ADDR),.CLK(CLK),.RST(RST));

REG1 w (.en(1),.data(wtemp),.q(W),.clk(CLK),.rst(RST));

AS9 ALU1(.A(A),.B(BUS),.Ci(ADDSUB),.Co(co),.S(ALU));

REG AFPreg  (.EN(AFPin),.D(BUS),.Q(AFP),.CLK(CLK),.RST(RST));
 
REG GFPreg  (.EN(GFPin),.D(FPU),.Q(GFP),.CLK(CLK),.RST(RST));

FPU ALU2    (.A(AFP),.B(BUS),.S(FPU),.ZERO(0),.ADDSUB(ADDSUB));


endmodule 