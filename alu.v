module alu(a,b,ci,co,s);
input[3:0] a,b;
input ci;
output[3:0] s;
output co;

wire[3:0] bn,m;

not u1 [3:0](bn,b);
mux_4bit u2 (.y(m),.i0(b),.i1(bn),.s(ci));
adder_4bit u3 (.a(a),.b(m),.s(s),.ci(ci),.co(co));

endmodule


module test_alu;

reg[3:0] a,b;
reg ci;
wire[3:0] s;
wire co;

alu alu1(.a(a),.b(b),.ci(ci),.co(co),.s(s));

initial begin
	a=4;b=2;ci=0;
#10	ci=1;
#10	$stop;
end
endmodule
 
