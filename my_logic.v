module my_logic(a,b,f,clk,out);
input[3:0] a,b;
input[1:0] f;
input clk;
output[3:0] out;
reg[3:0] out;
always@(posedge clk)begin
	case(f)
		0:out=a&b;
		1:out=a|b;
		2:out=a^b;
		3:out=~a;
	endcase
end
endmodule
module test_my_logic;
reg[3:0] a,b;
reg[1:0] f;
reg clk;
wire[3:0] out;
my_logic u1(a,b,f,clk,out);
initial begin
	a=4'b0101;b=4'b0011;f=2'b00;
#10	f=2'b01;
#10	f=2'b10;
#10	f=2'b11;
#15	$stop;
end
initial begin
clk=0;
	forever
		#5 clk=~clk;
end
endmodule
//21811957 jeongbomi