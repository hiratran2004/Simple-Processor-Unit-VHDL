
module REG1(data,clk,q,rst,en);
input data,clk,rst,en;
output reg q;

always_ff@ (posedge clk)
begin 

if (~rst) begin
q <= 1'b0;
end else begin 

if (en == 1) begin
q <= data;
end 

end  
end

endmodule
