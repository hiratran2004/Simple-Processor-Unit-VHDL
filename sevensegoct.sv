module sevensegoct (in,seg);

input [2:0] in;
output reg [6:0] seg;

always @(in)
    begin
        case(in)
	3'b000: seg = 7'b100_0000;
	3'b001: seg = 7'b111_1001;
	3'b010: seg = 7'b010_0100;
	3'b011: seg = 7'b011_0000;
	3'b100: seg = 7'b001_1001;
	3'b101: seg = 7'b001_0010;
	3'b110: seg = 7'b000_0010;
	3'b111: seg = 7'b101_1000;
            //switch off 7 segment character when the bcd digit is not a decimal number.
            default : seg = 7'b1111111; 
        endcase
    end
endmodule