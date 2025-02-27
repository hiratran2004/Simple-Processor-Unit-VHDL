module MUX11x1(IN0,IN1,IN2,IN3,IN4,IN5,IN6,IN7,IN8,IN9,IN10, SEL, OUT);
input [10:0] SEL;
input [8:0] IN0,IN1,IN2,IN3,IN4,IN5,IN6,IN7,IN8,IN9,IN10;
output reg [8:0] OUT;
always @(SEL or IN0 or IN1 or IN2 or IN3 or IN4 or IN5 or IN6 or IN7 or IN8 or IN9 or IN10 )
begin
case (SEL)
 11'b00000000001: OUT = IN0;
 11'b00000000010: OUT = IN1;
 11'b00000000100: OUT = IN2;
 11'b00000001000: OUT = IN3;
 11'b00000010000: OUT = IN4;
 11'b00000100000: OUT = IN5;
 11'b00001000000: OUT = IN6;
 11'b00010000000: OUT = IN7;
 11'b00100000000: OUT = IN8;
 11'b01000000000: OUT = IN9;
 11'b10000000000: OUT = IN10;
 
 default : OUT = 9'b000000000;
 
endcase
end

endmodule
