module count_3bit(clk,reset,count);
input clk,reset;
output[2:0] count;

reg[2:0] count;
always@(posedge clk or posedge reset)begin
	if(reset) count=0;
	else begin
		case(count)
			3'b000:count=3'b100;
			3'b100:count=3'b111;
			3'b111:count=3'b010;
			3'b010:count=3'b011;
			3'b011:count=3'b000;
			default:count=3'b000;
		endcase
	end
end
endmodule

module test_count_3bit;
reg clk,reset;
wire[2:0] count;

count_3bit u1(clk,reset,count);

initial begin
	reset=1;
#10 	reset=0;
#50 	$stop;
end
initial begin
clk=0;
	forever begin
		#5 clk=1;
		#5 clk=0;
	end
end
endmodule
