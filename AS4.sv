module AS4 (
input logic [3:0] A,
input logic [3:0] B,
input logic  Ci,
output [3:0] S,
output Co
);

logic Co0,Co1,Co2;
wire temp [3:0];

xor_gate g0(temp[0],Ci,B[0]);
xor_gate g1(temp[1],Ci,B[1]);
xor_gate g2(temp[2],Ci,B[2]);
xor_gate g3(temp[3],Ci,B[3]);

FA1 A0 (.a(A[0]),.b(temp[0]),.ci(Ci),.s(S[0]),.co(Co0));
FA1 A1 (.a(A[1]),.b(temp[1]),.ci(Co0),.s(S[1]),.co(Co1));
FA1 A2 (.a(A[2]),.b(temp[2]),.ci(Co1),.s(S[2]),.co(Co2));
FA1 A3 (.a(A[3]),.b(temp[3]),.ci(Co2),.s(S[3]),.co(Co));


endmodule

