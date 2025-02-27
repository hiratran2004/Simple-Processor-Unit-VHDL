module AS9 (
input logic [8:0] A,
input logic [8:0] B,
input logic  Ci,
output [8:0] S,
output Co
);

logic Co0,Co1,Co2,Co3,Co4,Co5,Co6,Co7;
wire temp [8:0];

xor_gate G0(temp[0],Ci,B[0]);
xor_gate G1(temp[1],Ci,B[1]);
xor_gate G2(temp[2],Ci,B[2]);
xor_gate G3(temp[3],Ci,B[3]);
xor_gate G4(temp[4],Ci,B[4]);
xor_gate G5(temp[5],Ci,B[5]);
xor_gate G6(temp[6],Ci,B[6]);
xor_gate G7(temp[7],Ci,B[7]);
xor_gate G8(temp[8],Ci,B[8]);

FA1 A0 (.a(A[0]),.b(temp[0]),.ci(Ci),.s(S[0]),.co(Co0));
FA1 A1 (.a(A[1]),.b(temp[1]),.ci(Co0),.s(S[1]),.co(Co1));
FA1 A2 (.a(A[2]),.b(temp[2]),.ci(Co1),.s(S[2]),.co(Co2));
FA1 A3 (.a(A[3]),.b(temp[3]),.ci(Co2),.s(S[3]),.co(Co3));
FA1 A4 (.a(A[4]),.b(temp[4]),.ci(Co3),.s(S[4]),.co(Co4));
FA1 A5 (.a(A[5]),.b(temp[5]),.ci(Co4),.s(S[5]),.co(Co5));
FA1 A6 (.a(A[6]),.b(temp[6]),.ci(Co5),.s(S[6]),.co(Co6));
FA1 A7 (.a(A[7]),.b(temp[7]),.ci(Co6),.s(S[7]),.co(Co7));
FA1 A8 (.a(A[8]),.b(temp[8]),.ci(Co7),.s(S[8]),.co(Co));


endmodule

