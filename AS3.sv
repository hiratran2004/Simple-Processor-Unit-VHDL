module AS3 (
input logic [2:0] A,
input logic [2:0] B,
input logic  Ci,
output [2:0] S,
output Co
);

logic Co0,Co1,Co2;
wire temp [2:0];

xor_gate (temp[0],Ci,B[0]);
xor_gate (temp[1],Ci,B[1]);
xor_gate (temp[2],Ci,B[2]);

FA1 A0 (.a(A[0]),.b(temp[0]),.ci(Ci),.s(S[0]),.co(Co0));
FA1 A1 (.a(A[1]),.b(temp[1]),.ci(Co0),.s(S[1]),.co(Co1));
FA1 A2 (.a(A[2]),.b(temp[2]),.ci(Co1),.s(S[2]),.co(Co));


endmodule

