`timescale 1ps/1ps

module Lab6_tb; 
			logic CLOCK_50;
			logic [9:0] SW;
			logic [0:0] KEY;
			logic [9:0] LEDR;
Lab6 hahaha(.CLOCK_50(CLOCK_50), .SW(SW), .KEY(KEY), .LEDR(LEDR));
			
initial begin
CLOCK_50 = 0;
SW = 0;
KEY = 0;
#15 SW = 1; KEY = 1;

end

always begin
#10 CLOCK_50 = ~CLOCK_50;
end			
endmodule
