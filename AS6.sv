module AS6 (
input logic [5:0] A,
input logic [5:0] B,
input logic  Ci,
output [5:0] S,
output Co
);

logic Co0,Co1,Co2,Co3,Co4;
wire temp [5:0];

xor_gate (temp[0],Ci,B[0]);
xor_gate (temp[1],Ci,B[1]);
xor_gate (temp[2],Ci,B[2]);
xor_gate (temp[3],Ci,B[3]);
xor_gate (temp[4],Ci,B[4]);
xor_gate (temp[5],Ci,B[5]);

FA1 A0 (.a(A[0]),.b(temp[0]),.ci(Ci),.s(S[0]),.co(Co0));
FA1 A1 (.a(A[1]),.b(temp[1]),.ci(Co0),.s(S[1]),.co(Co1));
FA1 A2 (.a(A[2]),.b(temp[2]),.ci(Co1),.s(S[2]),.co(Co2));
FA1 A3 (.a(A[3]),.b(temp[3]),.ci(Co2),.s(S[3]),.co(Co3));
FA1 A4 (.a(A[4]),.b(temp[4]),.ci(Co3),.s(S[4]),.co(Co4));
FA1 A5 (.a(A[5]),.b(temp[5]),.ci(Co4),.s(S[5]),.co(Co));


endmodule

