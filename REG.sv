module REG #(
parameter SIZE = 9
)(
input CLK,RST,EN,
input [SIZE - 1: 0] D,
output [SIZE - 1 : 0] Q
);


always_ff@ (posedge CLK)
begin 
if (~RST) begin
Q <= 0;
end else begin

if (EN) Q <= D;
else Q <= Q;

end 

end

endmodule
