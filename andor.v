module my_andor(a,b,d);

input a,b;
output d;

wire c;

and u1(c,a,b);
or u2(d,b,c);

endmodule

module test_my_andor;

	reg a, b;
	wire d;

	my_andor u1 (a,b,d);
	
	initial begin
		a=0; b=0;
	#10	b=1;
	#10	a=1; b=0;
	#10	b=1;
	#10	$stop;
	end

endmodule

//2020.09.05_21811957 jeongbomi