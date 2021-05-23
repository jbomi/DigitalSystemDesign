module cnt2_b(reset,clk,x,count);
input reset,clk,x;
output[1:0] count;
reg[1:0] count;
always@(posedge clk or posedge reset)begin
if(reset)count=2'b00;
	else begin
		case(count)
			2'b00:if(x==0) count<=2'b01;
			else count<=2'b10;
			2'b01:if(x==0)count<=2'b10;
			2'b10:count<=2'b11;
			2'b11:if(x==0)count<=2'b00;
			else count<=2'b01;
		endcase
	end
end
endmodule

module test_cnt2_b;
reg reset,clk,x;
wire[1:0] count;
cnt2_b u1(reset,clk,x,count);
initial begin
reset=1;x=0;
#10 reset=0;
#10 x=1;
#10 x=0;
#30 x=1;
#30 x=0;
#5 $stop;
end
initial begin
clk=0;
	forever begin
		#5 clk=~clk;
	end
end
endmodule//21811957 jeongbomi


