module mux_ff(a,b,c,d,s,clk,out);
input a,b,c,d,clk;
input[1:0] s;
output out;

reg out;
always@(posedge clk)begin
	case(s)
		0:out=a;
		1:out=b;
		2:out=c;
		3:out=d;
	endcase
end

endmodule

module test_mux_ff;
reg clk,a,b,c,d;
reg[1:0] s;
wire out;

mux_ff u1(a,b,c,d,s,clk,out);

initial begin
	a=1;b=0;c=0;d=1;s=0;
#10	c=1;d=0;s=1;
#10	a=0;b=1;c=0;d=1;s=2;
#10	c=1;d=0;s=3;
//#10	a=1;b=0;c=0;d=1;s=0;
#5	$stop;
end

initial begin
	clk=0;
	forever begin
		#5	clk=1;
		#5	clk=0;
	end
end
endmodule
