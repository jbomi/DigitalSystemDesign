module hw7_alu(a,b,f,co,s);
input[3:0] a,b;
input[1:0] f;
output[3:0] s;
output co;
wire[3:0] bn,m,n;
wire ci;

not u0 [3:0](bn,b);
mux_4bit u1(.y(m),.i0(0),.i1(a),.s(f[1]));
mux_4bit u2(.y(n),.i0(b),.i1(bn),.s(f[0]));
and u3(ci,f[0],f[1]);
adder_4bit u4(.a(m),.b(n),.s(s),.ci(ci),.co(co));

endmodule

module test_hw7_alu;
reg[3:0] a,b;
reg[1:0] f;
wire[3:0] s;
wire co;

hw7_alu alu7(.a(a),.b(b),.f(f),.co(co),.s(s));

initial begin
	a=4;b=2;f=0;
#10	f=1;
#10	f=2;
#10	f=3;
#10	$stop;
end

endmodule
//21811957 jeongbomi_hw7
