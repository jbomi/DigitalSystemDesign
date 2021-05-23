module comparator(a,b,y);
input[7:0] a,b;
output y;

assign y=&(a~^b);
endmodule

module test_comparator;
reg[7:0] a,b;
wire y;

comparator u0(.a(a),.b(b),.y(y));

initial begin
	a=8'hff;b=8'h00;
#10	a=8'h75;b=8'h75;
#10	a=8'h11;b=8'h12;
#10	$stop;

end

endmodule
//21811957 jeongbomi hw_8

