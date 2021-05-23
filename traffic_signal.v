module traffic_signal(reset,clk,red,yellow,green);
input reset,clk;
output red,yellow,green;
wire clr_count;
reg[5:0] count;
always@(posedge clk or posedge reset)begin
if(reset) count<=0;
else if(clr_count) count<=0;
else count<=count+1;
end
parameter red_st=0,yellow1_st=1,green_st=2,yellow2_st=3;
reg[1:0] state;
always@(posedge clk or posedge reset)begin
	if(reset) state<=red_st;
	else begin
		case(state)
			red_st:if(count==29) state<=yellow1_st;
			yellow1_st:if(count==4) state<=green_st;
			green_st:if(count==59) state<=yellow2_st;
			yellow2_st:if(count==4) state<=red_st;
		endcase
	end
end
wire red,yellow,green;
assign red=(state==red_st);
assign yellow=(state==yellow1_st)||(state==yellow2_st);
assign green=(state==green_st);
assign clr_count=(count==29&&state==red_st)||(count==4&&state==yellow1_st)|(count==59&&state==green_st)||(count==4&&state==yellow2_st);
endmodule
module test_traffic_signal;
reg reset,clk;
wire red,yellow,green;
traffic_signal u1(reset,clk,red,yellow,green);
initial begin
	reset=1;
#10	reset=0;
#2000	$stop;
end
initial begin
clk=0;
	forever begin
		#5 clk=~clk;
	end
end
endmodule//21811957 jeognbomi


