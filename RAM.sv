module RAMinit
#(parameter int unsigned width = 9,
parameter int unsigned depth = 128,
parameter addrBits = 7)
(
input logic CLK,W,
input logic [addrBits-1:0] ADDRESS,
input logic [width-1:0] DATAIN,
output logic [width-1:0] DATAOUT

);

// initialise ROM contents

RAM dut(
	.address(ADDRESS),
	.data(DATAIN),
	.inclock(CLK),
	.wren(W),
	.q(DATAOUT));




endmodule 