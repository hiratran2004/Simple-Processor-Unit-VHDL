module FSM(RUN,RST,CLK,IR,IRin,Rout,Rin,Gout,DINout,Ain,ADDSUB,Gin,DONE,INCR,ADDRin,W,PCin,DOUTin,STATE,ZERO,AFPin,GFPin,GFPout); 
input RUN,RST,CLK,ZERO;
input [8:0] IR;
output [7:0] Rout,Rin;
output Gout,DINout,Ain,ADDSUB,Gin,IRin,DONE,INCR,ADDRin,W,PCin,DOUTin,AFPin,GFPin,GFPout;
output [3:0] STATE;

localparam I0 = 3'b000, I1 = 3'b001 , I2 = 3'b010 , I3 = 3'b011 , I4 = 3'b100, I5 = 3'b101 , I6 = 3'b110, I7 =3'b111 ;

localparam IDLE = 4'b0000, WAIT = 4'b0001 , T0 = 4'b0010 , T1 = 4'b0011 , T2 = 4'b0100,  T3 = 4'b0101 , T4 = 4'b0110, T5 = 4'b0111  , T6 = 4'b1000, T7 = 4'b1001, T8 = 4'b1010, T9 = 4'b1011, T10 = 4'b1100,T11 = 4'b1101;


reg  [3:0] curState, nxtState;
reg [3:0] I ;
reg  [7:0] X_REG, Y_REG ;
reg PCintemp;


DECODER3x8 D1 (.IN(IR[5:3]),.OUT(X_REG),.EN(1));                                                                                   
DECODER3x8 D2 (.IN(IR[2:0]),.OUT(Y_REG),.EN(1));

assign STATE = curState;
assign PCin = Rin[7] | PCintemp;

always @(posedge CLK, negedge RST) begin 
      curState = nxtState; 
		I = IR[8:6];
		
		if(!RST) begin
		nxtState <= IDLE ;
		end else begin
		case (curState) 
		IDLE : begin 
				if (~RUN) nxtState = IDLE; 
				else nxtState = WAIT; 
					
				 end 
				 
		WAIT : begin
				 nxtState = T0;
				 end 
		T0 : begin
				 nxtState = T1; 
		     end
		
		T1 : begin 	
				if (IR == 9'b000000000) nxtState = IDLE; 
			   else begin 
				case (I)
				I0 : nxtState = T2;
 				I1 : nxtState = T2;
				I2 : nxtState = T2;
				I3 : nxtState = T2;
 				I4 : nxtState = T5;
				I5 : nxtState = T5;
				I6 : nxtState = T8;
				I7 : nxtState = T2;
				endcase 
				end
			  end
		
		T2 : begin	
			 	if (I == I0 || I == I6 ) nxtState = IDLE; 
				else nxtState = T3 ;
			  end
		
		T3 : begin 
				 nxtState = T4; 
			  end
			  
	   T4 : begin 
			  if (I == I1) nxtState = T11 ;
			  else nxtState = IDLE ;
			  
			  end
			  
		T5 : begin 
			  nxtState = T6 ;
			  end
			  
		T6 : begin 
			  nxtState = T7 ;
			  end
			  
		T7 : begin 
			  nxtState = T10 ;
			  end
			  
		T8 : begin 
			  nxtState = T9 ;
			  end
			  
		T9 : begin 
		if (ZERO == 1'b0) nxtState = IDLE ;
		else nxtState = T2;
			  end
		T10 : nxtState = IDLE ;
		
		T11 : nxtState = IDLE ;
			  
      endcase 
		end
end

always @(curState or X_REG or Y_REG or I) begin
case (curState)
      IDLE : begin 
 Rout		= 8'b10000000;
 Rin  	= 8'b00000000;
 Gout 	= 1'b0 ;DINout	= 1'b0 ;Ain		= 1'b0 ;ADDSUB		= 1'b0 ;
 Gin		= 1'b0 ;IRin	= 1'b0 ;DONE	= 1'b0 ;INCR		= 1'b0 ;
 ADDRin	= 1'b1 ;W		= 1'b0 ;DOUTin	= 1'b0 ;PCintemp 	= 1'b0 ;
		       end 
				 
		WAIT : begin
 Rout		= 8'b00000000;
 Rin  	= 8'b00000000;
 Gout 	= 1'b0 ;DINout	= 1'b0 ;Ain		= 1'b0 ;ADDSUB		= 1'b0 ;
 Gin		= 1'b0 ;IRin	= 1'b0 ;DONE	= 1'b0 ;INCR		= 1'b0 ;
 ADDRin	= 1'b0 ;W		= 1'b0 ;DOUTin	= 1'b0 ;PCintemp 	= 1'b0 ;			
		       end 
				 
		T0 : begin
 Rout		= 8'b00000000;
 Rin  	= 8'b00000000;
 Gout 	= 1'b0 ;DINout	= 1'b0 ;Ain		= 1'b0 ;ADDSUB		= 1'b0 ;
 Gin		= 1'b0 ;IRin	= 1'b1 ;DONE	= 1'b0 ;INCR		= 1'b0 ;
 ADDRin	= 1'b0 ;W		= 1'b0 ;DOUTin	= 1'b0 ;PCintemp 	= 1'b0 ;				 
		     end
		
		T1 : begin 	
 Rout		= 8'b00000000;
 Rin  	= 8'b00000000;
 Gout 	= 1'b0 ;DINout	= 1'b0 ;Ain		= 1'b0 ;ADDSUB		= 1'b0 ;
 Gin		= 1'b0 ;IRin	= 1'b0 ;DONE	= 1'b0 ;INCR		= 1'b1 ;
 ADDRin	= (I == I1)? 1'b1 : 1'b0 ;W		= 1'b0 ;DOUTin	= 1'b0 ;PCintemp 	= 1'b1 ;		

 
		     end
		
		T2 : begin	
 Rout		= ( I == I2 || I == I3 || I == I7 )?  X_REG : (I == I0 || I == I6)? Y_REG : 8'b10000000;
 Rin  	= (I == I0 || I == I6)? X_REG : 8'b00000000;
 Gout 	= 1'b0 ;DINout	= 1'b0 		;Ain		= (I == I2 || I == I3)? 1'b1 : 1'b0 ;ADDSUB		= 1'b0                                     ; GFPin  = 1'b0;
 Gin		= 1'b0 ;IRin	= 1'b0 		;DONE		= (I == I0 || I == I6)? 1'b1 : 1'b0 ;INCR			= (I == I1)? 1'b1 : 1'b0                   ; GFPout = 1'b0;
 ADDRin	= (I == I1)? 1'b1 : 1'b0   ;W			= 1'b0 										;DOUTin	= 1'b0 	;PCintemp 	= (I == I1)? 1'b1 : 1'b0 ;	AFPin  = (I == I7)? 1'b1 : 1'b0;		 	
		     end		
		
		T3 : begin 
 Rout		= ( I == I2 || I == I3 || I == I7)? Y_REG : 8'b00000000;
 Rin  	=  8'b00000000 ;
 Gout 	= 1'b0 												 ;DINout	= (I == I1)? 1'b1 : 1'b0 ;Ain		= 1'b0 	;ADDSUB	= (I == I3)? 1'b1 : 1'b0; GFPin = (I == I7)? 1'b1 : 1'b0;
 Gin		= ( I == I2 || I == I3 )? 1'b1 : 1'b0  	 ;IRin	= 1'b0	 					 ;DONE	=  1'b0 	;INCR		= 1'b0 						; GFPout = 1'b0;
 ADDRin	=  1'b0 												 ;W		= 1'b0 	 					 ;DOUTin	= 1'b0 	;PCintemp 	= 1'b0					; AFPin = 1'b0;			 
		     end		
			  
	    T4 : begin 
 Rout		= 8'b00000000;
 Rin  	= X_REG;
 Gout 	= (I == I1 || I == I7)? 1'b0 : 1'b1 ;    DINout	= (I == I1)? 1'b1 : 1'b0 ;Ain		= 1'b0 	 ;ADDSUB		= 1'b0 ; GFPin = 1'b0;
 Gin		= 1'b0 ;IRin	= 1'b0               ;DONE	= (I != I1)? 1'b1 :1'b0 	 				 ;INCR		= 1'b0 ; GFPout = (I == I7)? 1'b1: 1'b0;
 ADDRin	= 1'b0 ;W		= 1'b0 ;DOUTin	= 1'b0    																 ;PCintemp 	= 1'b0 ; AFPin = 1'b0;		
		     end
			  
	    T5 : begin 
 Rout		= Y_REG;
 Rin  	= 8'b00000000;
 Gout 	= 1'b0 ;DINout	= 1'b0 ;Ain		= 1'b0 ;ADDSUB		= 1'b0 ;
 Gin		= 1'b0 ;IRin	= 1'b0 ;DONE	= 1'b0 ;INCR		= 1'b0 ;
 ADDRin	= 1'b1 ;W		= 1'b0 ;DOUTin	= 1'b0 ;PCintemp 	= 1'b0 ;			
		     end
			  
	    T6 : begin 
 Rout		= (I == I5)? X_REG :8'b00000000;
 Rin  	= 8'b00000000;
 Gout 	= 1'b0 ;DINout	= (I == I4)? 1'b1 : 1'b0 ;Ain		= 1'b0 ;ADDSUB		= 1'b0 ;
 Gin		= 1'b0 ;IRin	= 1'b0 ;DONE	= 1'b0 ;INCR		= 1'b0 ;
 ADDRin	= 1'b0 ;W		= 1'b0 ;DOUTin	= (I == I5)? 1'b1 : 1'b0 ;PCintemp 	= 1'b0 ;			
		     end
			  
	    T7 : begin 
 Rout		= 8'b00000000;
 Rin  	= (I == I4)? X_REG :8'b00000000;
 Gout 	= 1'b0 ;DINout	= (I == I4)? 1'b1 : 1'b0 ;Ain	= 1'b0    ;ADDSUB		= 1'b0 ;
 Gin		= 1'b0 ;IRin	= 1'b0 						 ;DONE	= (I == I5)? 1'b1 : 1'b0  	 ;INCR		= 1'b0 ;
 ADDRin	= 1'b0 ;W		= (I == I5)? 1'b1 : 1'b0 ;DOUTin	= 1'b0 ;PCintemp 	= 1'b0 ;			
		     end
			  
	    T8 : begin 
 Rout		= 8'b00000000;
 Rin  	= 8'b00000000;
 Gout 	= 1'b0 ;DINout	= 1'b0 ;Ain		= 1'b0 ;ADDSUB		= 1'b0 ;
 Gin		= 1'b0 ;IRin	= 1'b0 ;DONE	= 1'b0 ;INCR		= 1'b0 ;
 ADDRin	= 1'b0 ;W		= 1'b0 ;DOUTin	= 1'b0 ;PCintemp 	= 1'b0 ;			
		     end
			  
	    T9 : begin 
 Rout		= 8'b00000000;
 Rin  	= 8'b00000000;
 Gout 	= 1'b0 ;DINout	= 1'b0 ;Ain		= 1'b0 ;ADDSUB		= 1'b0 ;
 Gin		= 1'b0 ;IRin	= 1'b0 ;DONE	= 1'b0 ;INCR		= 1'b0 ;
 ADDRin	= 1'b0 ;W		= 1'b0 ;DOUTin	= 1'b0 ;PCintemp 	= 1'b0 ;			
		     end
		T10 : begin 
 Rout		= 8'b00000000;
 Rin  	= 8'b00000000;
 Gout 	= 1'b0 ;DINout	= 1'b0 ;Ain		= 1'b0 ;ADDSUB		= 1'b0 ;
 Gin		= 1'b0 ;IRin	= 1'b0 ;DONE	= 1'b1 ;INCR		= 1'b0 ;
 ADDRin	= 1'b0 ;W		= 1'b0 ;DOUTin	= 1'b0 ;PCintemp 	= 1'b0 ;			
		     end
			  
		T11 : begin 
 Rout		= 8'b00000000;
 Rin  	= 8'b00000000;
 Gout 	= 1'b0 ;DINout	= 1'b0 ;Ain		= 1'b0 ;ADDSUB		= 1'b0 ;
 Gin		= 1'b0 ;IRin	= 1'b0 ;DONE	= 1'b1 ;INCR		= 1'b0 ;
 ADDRin	= 1'b0 ;W		= 1'b0 ;DOUTin	= 1'b0 ;PCintemp 	= 1'b0 ;			
		     end
endcase 
end

endmodule 