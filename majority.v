module majority(a,b,c,y);

input a,b,c;
output y;
wire e,f,g;

and u0(e,a,b);
and u1(f,b,c);
and u2(g,a,c);
or u3(y,e,f,g); 

endmodule

module test_majority;

reg a,b,c;
wire y;

majority u0(a,b,c,y);

initial begin
	a=0;b=0;c=0;
#10	        c=1;
#10	    b=1;c=0;
#10	        c=1;
#10	a=1;b=0;c=0;
#10		c=1;
#10	    b=1;c=0;
#10		c=1;
#10	$stop;

end
//21811957 jeongbomi
endmodule
