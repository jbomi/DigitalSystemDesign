
module my_xor3(a,b,d);
input a,b;
output d;
wire c;

xor u1(c,a,b);
xor u2(d,b,c);

endmodule

module test_my_xor3;
reg a,b;
wire d;

my_xor3 u1(a,b,d);

initial begin
	a=0;b=0;
#10	b=1;
#10	a=1;b=0;
#10	b=1;
#10	a=0;b=0;
#10	$stop;

end

endmodule
//20.09.08
//21811957 jeongbomi
