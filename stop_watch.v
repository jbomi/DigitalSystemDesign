module stop_watch(reset,clk,start,stop,clear,hour,min,sec); //21811957 jeongbomi
input reset,clk,start,stop,clear;
output[3:0] hour;
output[5:0] min,sec;
cont1 cont1(clk,reset,clear,start,stop,work,init);
clock1 clock1(reset,clk,work,init,hour,min,sec);
endmodule

module cont1(clk,reset,clear,start,stop,work,init);
input clk,reset,clear,start,stop;
output work,init;
reg init;
always@(posedge clk or posedge reset)begin
if(clear==1) init<=1;
else init<=0;
end
reg work;
always@(posedge clk or posedge reset)begin
if(start==1)work<=1;
else if(stop==1) work<=0;
end
endmodule

module clock1(reset,clk,work,init,hour,min,sec);
input reset,clk,work,init;
output[3:0] hour;
output[5:0] min,sec;

reg[5:0] sec;
always@(posedge clk or posedge reset)begin
if(reset)sec<=0;
	else if(init==1)sec<=0;
	else if(work)begin
		if(sec==59)sec<=0;
		else sec<=sec+1;
	end
end

reg[5:0] min;
always@(posedge clk or posedge reset)begin
if(reset)min<=0;
	else if(init==1)min<=0;
	else if(work&&sec==59)begin
		if(min==59)min<=0;
		else min<=min+1;
	end
end

reg[3:0] hour;
always@(posedge clk or posedge reset)begin
if(reset)hour<=0;
	else if(init==1)hour<=0;
	else if(work)begin
		if(min==59&&sec==59)begin
			if(hour==11)hour<=0;
			else hour<=hour+1;
		end
	end
end
endmodule

module test_my_stop_watch;
reg clk,reset,stop,start,clear;
wire[3:0] hour;
wire[5:0] min,sec;
stop_watch u1(reset,clk,start,stop,clear,hour,min,sec);

initial begin
reset=1;stop=0;start=0;clear=0;
#10	reset=0;
#100	start=1;
#20	start=0;
#100	stop=1;
#20	stop=0;
#50 	clear=1;
#20 	clear= 0;
#1000 	start= 1;
#20 	start= 0;
#460000 $stop;
end

initial begin 
clk = 0;
	forever begin
		#5 clk = ~clk;
	end
end
endmodule
