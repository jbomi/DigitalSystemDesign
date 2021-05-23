module sma(clk,reset,x,y,z);
input clk,reset,x;
output y,z;

parameter S0=0,S1=1,S2=2,S3=3;

reg[1:0] state;

always@(posedge clk or posedge reset)begin
	if(reset)state<=S0;
	else begin
		case(state)
			S0:if(x) state<=S1;
			S1:state<=S2;
			S2:if(!x)state<=S3;
			S3:state<=S0;
		endcase
	end
end
wire y,z;
assign y=(state==S1) | (state==S2);
assign z=(state==S0) &x | (state ==S2) & ~x;
endmodule

module test_sma; 
reg clk,reset,x;
wire y,z;

sma sma1(clk,reset,x,y,z);
initial begin
	reset=1;x=0;
#10	reset=0;
#10	x=1;
#40	x=0;
#25	$stop;
end

initial begin
clk=0;
	forever begin
	#5 clk=~clk;
	end
end
endmodule	//21811957 jeongbomi
