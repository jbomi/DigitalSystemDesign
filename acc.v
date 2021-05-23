module acc(clk,in,clear,a);
input[3:0] in;
input clk,clear;
output[7:0] a;
reg[7:0] a;
always@(posedge clk)begin
if(clear==1) a=0;
else a=a+in;
end
endmodule

module test_acc;
reg[3:0] in;
reg clk,clear;
wire[7:0] a;
integer i;
acc u1(clk,in,clear,a);
initial begin
in=0;
for(i=1;i<=10;i=i+1)begin
#10	in=i;
end
#10	$stop;
end
initial begin
	clk=0;
	forever begin
		#5	clk=1;
		#5	clk=0;
	end
end
initial begin
clear=1;
#10 clear=0;
end
endmodule//21811957_jeongbomi


