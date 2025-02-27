module HZ4 (CLKout,CLKin);
input CLKin;
output CLKout;

parameter CLKconst = 12500000;
int count; 

always_ff @(posedge CLKin) begin 
if (count < CLKconst) begin
count <= count + 1 ; 
end else begin 
count <= 0 ; 
CLKout <= ~CLKout ; 
end
end
endmodule