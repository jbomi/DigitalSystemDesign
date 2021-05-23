module conc_op(a,b,c,inv,y,op,z);
input[3:0] a,b;
input[7:0] c;
input inv;
output[7:0] y,z;
output[3:0] op;

wire[7:0] x;
assign x={a,b};

wire[7:0] y;
assign y=~(x&c);

wire[3:0] op;
assign op=c[7:4];

wire[7:0] z;
assign z=c^{8{inv}};

endmodule

module test_conc_op;
reg[3:0] a,b;
reg[7:0] c;
reg inv;
wire[7:0] y,z;
wire[3:0] op;

conc_op conc0(a,b,c,inv,y,op,z);
initial begin
	a=4'hf;b=4'h0;c=8'hff;inv=0;
#10	a=4'h0;	      c=8'h00;inv=1;
#10	a=4'hf;b=4'hf;c=8'hff;
#10	$stop;
end
endmodule
