module initROM
#(parameter int unsigned width = 9,
parameter int unsigned depth = 32,
parameter addrBits = 5)
(
input logic CLK,
input logic [addrBits-1:0] ADDRESS,
output logic [width-1:0] DATAOUT
);
logic [width-1:0] rom [0:depth-1];
// initialise ROM contents
initial begin
$readmemb("ROM.mif",rom);

end
always_ff @ (posedge CLK)
begin
DATAOUT <= rom[ADDRESS];
end
endmodule 