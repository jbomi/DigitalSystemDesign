module mux_1bit(a,b,s,y);
input a,b,s;
output y;

wire c,d,e;
not u0(c,s);
and u1(d,a,c);
and u2(e,b,s);
or u3(y,d,e);

endmodule 


module test_mux_1bit;

reg a,b,s;
wire y;

mux_1bit u1(a,b,s,y);

initial begin
s=0;a=0;b=0;
#10 b=1;
#10 a=1;b=0;
#10 b=1;
#10 a=0;b=0;s=1;
#10 b=1;
#10 a=1;b=0;
#10 b=1;
#10 $stop;
end
endmodule
//21811957 jeongbomi  