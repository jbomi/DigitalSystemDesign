module mux_4x1(a,b,c,d,s0,s1,y);
input a,b,c,d,s0,s1;
wire e,f;
output y;
 
mux_1bit u0(a,b,s0,e);
mux_1bit u1(c,d,s0,f);
mux_1bit u2(e,f,s1,y);

endmodule

module test_mux_4x1;
reg a,b,c,d,s0,s1;
wire y;

mux_4x1 u5(a,b,c,d,s0,s1,y);

initial begin
a=0;b=0;c=1;d=0;s1=0;s0=0;
#10 b=1;c=0;d=1;s0=1;
#10 a=1;b=0;c=1;s1=1;s0=0;
#10 b=1;d=0;s0=1;
#10 $stop;
end

endmodule
//21811957 jeongbomi