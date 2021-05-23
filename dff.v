module dff(clk,d,q);
input clk,d;
output q;
reg q;
always@(posedge clk)
q=d;
endmodule

module test_dff;
reg clk,d;
wire q;
dff u1(clk,d,q);

initial begin
	d = 0;
#7	d = 1;
#4	d = 0;
#11 	d = 1;
#4 	d = 0;
#3 	d = 1;
#2 	d = 0;
#4 	$stop;
end
initial begin
clk=0;
forever begin
#5 clk=1;
#5 clk=0;
end
end 
endmodule
//21811957 jeongbomi

