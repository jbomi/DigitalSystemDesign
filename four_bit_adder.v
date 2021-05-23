module four_bit_adder(a,b,ci,s,co);

input[3:0] a,b;
input ci;
output[3:0] s;
output co;

wire c1,c2,c3;

full_adder u0(.a(a[0]),.b(b[0]),.c(ci),.s(s[0]),.co(c1));
full_adder u1(.a(a[1]),.b(b[1]),.c(c1),.s(s[1]),.co(c2));
full_adder u2(.a(a[2]),.b(b[2]),.c(c2),.s(s[2]),.co(c3));
full_adder u3(.a(a[3]),.b(b[3]),.c(c3),.s(s[3]),.co(co));

endmodule

module test_four_bit_adder;

reg[3:0] a,b;
reg ci;
wire[3:0] s;
wire co;

four_bit_adder u0(a,b,ci,s,co);

initial begin
	a=4'b0000;b=4'b0000;ci=0;
#10 			    ci=1;
#10	a=4'b0010;b=4'b0100;ci=0;
#10	a=4'b1111;b=4'b0000;ci=1;
#10		  b=4'b1111;
#10 $stop;

end
endmodule
 //21811957 jeongbomi
