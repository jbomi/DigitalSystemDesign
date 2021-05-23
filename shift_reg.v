module shift_reg(clk,in,q3);
input clk,in;
output q3;

reg q1,q2,q3;

always@(posedge clk)begin
	q1=in;
	q2=q1;
	q3=q2;
end
endmodule

module test_shift_reg;
reg clk,in;
wire q3;

shift_reg shift_reg1(.clk(clk),.in(in),.q3(q3));
initial begin
	repeat(3)begin
		in=1;
		#10 in=0;
		#20;
	end
	#5 $stop;
end
initial begin
clk=0;
	forever begin
		#5 clk=1;
		#5 clk=0;
	end
end
endmodule
