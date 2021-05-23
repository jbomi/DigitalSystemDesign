module mul7(a,y);
input[7:0] a;
output[10:0] y;

wire[7:0] a;
wire[10:0] y;
assign y=(a<<3)-a;
endmodule

module test_mul7;
reg[7:0] a;
wire[10:0] y;

mul7 mul(a,y);
initial begin
	a=0;
#10	a=1;
#10	a=10;
#10	a=100;
#10	a=255;
#10	$stop;
end

endmodule
