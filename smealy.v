module smealy(clk,reset,x,z);
input clk, reset, x;
output z;
parameter S0=0,S1=1,S2=2,S3=3;
reg[1:0] state;
always@(posedge clk or posedge reset) begin
	if(reset) state<= S0;
	else begin
		case(state)
			S0:if(x) state<=S2;
			else state <=S1;
			S1: state<=S2;
			S2: state<=S3;
			S3: state<=S0;
		endcase
	end
end

wire z;
assign z=(state ==S0)&x;
endmodule

module test_smealy;
reg clk,reset,x;
wire z;

smealy u1(clk,reset,x,z);
initial begin
reset=1;x=0;
#10 reset=0;
#30 x=1;
#30 x=0;
#15 $stop;
end
initial begin
clk=0;
forever begin
#5 clk=~clk;
end
end
endmodule
//21811957 jeongbomi
