module full_adder(a,b,c,s,co);

input a,b,c;
output s, co;
wire d,e,f;

xor u1(d,a,b);
xor u2(s,c,d);
and u3(e,c,d);
and u4(f,a,b);
or u5(co,e,f);

endmodule

module test_full_adder;

reg a,b,c;
wire s, co;

full_adder u1(a,b,c,s,co);

initial begin
	a=0;b=0;c=0;
#10	c=1;
#10	b=1;c=0;
#10	c=1;
#10	a=1;b=0;c=0;
#10	c=1;
#10	b=1;c=0;
#10	c=1;
#10	$stop;
end

endmodule
//2020.09.11_21811957 jeongbomi