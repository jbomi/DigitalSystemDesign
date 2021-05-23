module dff_and(clk,a,b,q);
input a,b,clk;
output q;

reg q;
always@(posedge clk)begin
q=a&b;
end

endmodule

module test_dff_and;
reg a,b,clk;
wire q;

dff_and u1(clk,a,b,q);
initial begin
	a=1;b=0;
#10	a=0;
#10	a=1;b=1;
#10	a=0;
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
//21811957_jeongbomi
