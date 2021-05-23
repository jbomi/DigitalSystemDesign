module ff_init_a(clk,reset,d,q);
input clk,reset,d;
output q;

reg q;
always@(posedge clk or posedge reset)begin
if(reset) q=0;
else q=d;
end

endmodule

module test_ff_init_a;
reg clk,reset,d;
wire q;

ff_init_a u1(clk,reset,d,q);

initial begin
	reset=1;d=1;
#10	reset=0;
#30	reset=1;
#10	reset=0;
#10	$stop;
end

initial begin
clk=0;
forever begin
#5	clk=1;
#5	clk=0;
end
end
endmodule//21811957 jeongbomi

