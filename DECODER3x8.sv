module DECODER3x8(IN, EN, OUT);
input [2:0] IN;
input EN;
output reg [0:7] OUT;
always @(IN or EN)
begin
if (EN == 1) begin
case (IN)
 3'b000: OUT = 8'b00000001;
 3'b001: OUT = 8'b00000010;
 3'b010: OUT = 8'b00000100;
 3'b011: OUT = 8'b00001000;
 3'b100: OUT = 8'b00010000;
 3'b101: OUT = 8'b00100000;
 3'b110: OUT = 8'b01000000;
 3'b111: OUT = 8'b10000000;
 
endcase
end
else OUT = 8'b00000000;
end
endmodule
