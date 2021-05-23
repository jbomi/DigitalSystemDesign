module ring_cnt(reset,clk,q3,q2,q1,q0);
input reset,clk;
output q3,q2,q1,q0;
reg q3,q2,q1,q0;
always@(posedge clk or posedge reset)begin
	if(reset)begin
		q3<=0;q2<=0;q1<=0;q0<=1;
	end
	else begin
		q3<=q2;
		q2<=q1;
		q1<=q0;
		q0<=q3;
	end
end
endmodule

module test_ring_cnt;
reg clk,reset;
wire q3,q2,q1,q0;
ring_cnt u1(reset,clk,q3,q2,q1,q0);
initial begin
	reset=1;
	#10	reset=0;
	#50	$stop;
end
initial begin
clk=0;
forever begin
#5 clk=1;
#5 clk=0;
end
end
endmodule //21811957 jeongbomi
