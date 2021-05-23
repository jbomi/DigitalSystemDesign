module ff_init_b(clk,nreset,d,q);
input clk,nreset,d;
output q;
reg q;
always@(posedge clk or negedge nreset)begin
if(!nreset) q=0;
else	q=d;
end
endmodule

module test_ff_init_b;
reg clk,nreset,d;
wire q;

ff_init_b u1(clk,nreset,d,q);

initial begin
	nreset=0;d=1;
#10	nreset=1;
#30	nreset=0;
#10	nreset=1;
#10	$stop;
end
initial begin
clk=0;
forever begin
	#5	clk=1;
	#5	clk=0;
end
end
endmodule
