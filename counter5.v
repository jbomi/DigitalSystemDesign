module counter5(clk,reset,count);
input clk,reset;
output[4:0] count;
reg[4:0] count;
always@(posedge clk or posedge reset)begin
if(reset==1) count=5'h11;
else count=count+1;
end
endmodule

module test_counter5;
reg clk,reset;
wire[4:0] count;
counter5 u1(clk,reset,count);

initial begin
reset=1;
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
endmodule
//hw14 21811957 jeongbomi
