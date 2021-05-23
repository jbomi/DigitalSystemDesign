module abs(a,b,bo,s0,s1,y);
input[7:0] a,b;
output[7:0] y,s0,s1;
output bo;
assign {bo,s0}=a-b;
assign s1=b-a;
assign y=bo?s1:s0;
endmodule

module test_abs;
reg[7:0] a,b;
wire[7:0] y,s0,s1;
wire bo;

abs u1(a,b,bo,s0,s1,y);
initial begin
	a=100;b=50;
#10 	      b=255;
#10	a=0;  b=1;
#10	a=2;
#10	$stop;
end
endmodule
//21811957 jeongbomi