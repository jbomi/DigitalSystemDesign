module add_mux(clk,s,in,out);
input clk,in,s;
output out;
reg out;
always@(posedge clk)begin
if(s==1) out=in;
end
endmodule

module test_add_mux;
reg clk,in,s;
wire out;
add_mux u1(clk,s,in,out);

initial begin
	in=1;s=0;
#10	s=1;
#10	in=0;s=0;
#10	s=1;
#10	$stop;
end

initial begin
	clk=0;
	forever begin
		#5	clk=1;
		#5	clk=0;
	end
end
endmodule
