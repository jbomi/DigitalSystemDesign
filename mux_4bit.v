module mux_4bit(a,b,s,y);

input[3:0] a,b;
input s;
output[3:0] y;

mux_1bit u0(a[0],b[0],s,y[0]);
mux_1bit u1(a[1],b[1],s,y[1]);
mux_1bit u2(a[2],b[2],s,y[2]);
mux_1bit u3(a[3],b[3],s,y[3]);

endmodule


module test_mux_4bit;

reg[3:0] a,b;
reg s;
wire[3:0] y;

mux_4bit u0(a,b,s,y);

initial begin
a=4'b0000;b=4'b1111;s=0;
#10 s=1;
#10 a=4'b1010;b=4'b0101;s=0;
#10 s=1;
#10 $stop;
end
endmodule
//21811957 jeongbomi 