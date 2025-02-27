module demux4b1x2(OUT1,OUT2,IN,SEL);

input [3:0] IN;
input SEL; 

output [3:0] OUT1,OUT2;

demux1b1x2 demux1(.in(IN[0]),.sel(SEL),.out1(OUT1[0]),.out2(OUT2[0]));
demux1b1x2 demux2(.in(IN[1]),.sel(SEL),.out1(OUT1[1]),.out2(OUT2[1]));
demux1b1x2 demux3(.in(IN[2]),.sel(SEL),.out1(OUT1[2]),.out2(OUT2[2]));
demux1b1x2 demux4(.in(IN[3]),.sel(SEL),.out1(OUT1[3]),.out2(OUT2[3]));



endmodule
