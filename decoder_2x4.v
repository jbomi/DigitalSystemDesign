module decoder_2x4(a,b,d0,d1,d2,d3);

input a,b;
wire e,f;
output d0,d1,d2,d3;

not u1(e,a);
not u2(f,b);

and u3(d0,e,f);
and u4(d1,e,b);
and u5(d2,a,f);
and u6(d3,a,b);

endmodule

module test_decoder_2x4;

reg a,b;
wire d0,d1,d2,d3;

decoder_2x4 decoder_2x4_1(a,b,d0,d1,d2,d3);

initial begin 
	a=0;b=0;
#10	b=1;
#10	a=1;b=0;
#10	b=1;
#10	$stop;

end
endmodule
//2020.09.11_21811957 jeongbomi