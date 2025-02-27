module mux1b8x1 (out,in0,in1,in2,in3,in4,in5,in6,in7,sel);
input in0,in1,in2,in3,in4,in5,in6,in7;
input [2:0] sel;
output out;

assign out = (in0&~sel[0]&~sel[1]&~sel[2]) | (in1&sel[0]&~sel[1]&~sel[2]) | (in2&~sel[0]&sel[1]&~sel[2]) | (in3&sel[0]&sel[1]&~sel[2]) | (in4&~sel[0]&~sel[1]&sel[2]) | (in5&sel[0]&~sel[1]&sel[2]) | (in6&~sel[0]&sel[1]&sel[2])| (in7&sel[0]&sel[1]&sel[2]) ;


endmodule 
