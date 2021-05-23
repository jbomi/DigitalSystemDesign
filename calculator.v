module calculator(nrst,clk,valid_input,input_value,inreg,result);
input nrst,clk,valid_input;
input[4:0] input_value;
output[15:0] inreg,result;
reg[15:0] inreg, result;
reg saved_command;
always@(posedge clk or negedge nrst)begin
if(!nrst) inreg<=0;
	else if(valid_input)begin
		if(input_value[4]) inreg<=0;
		else inreg<={inreg[11:0],input_value[3:0]};
	end
end
parameter plus=5'h10,minus=5'h11,equal=5'h12,clear=5'h13;
always@(posedge clk or negedge nrst)begin
	if(!nrst)result<=0;
	else if(valid_input)begin
		if(input_value==clear) result<=0;
		else if(input_value[4])begin
			if(saved_command) result<=result-inreg;
			else result<=result+inreg;
		end
	end 
end 
always@(posedge clk or negedge nrst)begin
	if(!nrst) saved_command<=0;
	else if(valid_input&&input_value[4])begin
		if(input_value==minus) saved_command<=1;
		else saved_command<=0;
	end
end
endmodule

module test_calculator; 
reg nrst, clk;
reg valid_input;
reg[4:0] input_value;
wire[15:0] inreg, result;

calculator calculator1 (nrst, clk, valid_input, input_value, inreg, result);

initial begin
nrst = 0; valid_input = 0; input_value = 0;
#10 nrst = 1;
#10 valid_input = 1; input_value = 5'h01;	// 1
#10 valid_input = 0;
#10 valid_input = 1; input_value = 5'h00;	// 0
#10 valid_input = 0;
#10 valid_input = 1; input_value = 5'h00;	// 0
#10 valid_input = 0;

#10 valid_input = 1; input_value = 5'h10;	// +
#10 valid_input = 0;

#10 valid_input = 1; input_value = 5'h08;	// 8
#10 valid_input = 0;
#10 valid_input = 1; input_value = 5'h00;	// 0
#10 valid_input = 0;
#10 valid_input = 1; input_value = 5'h11;	// -
#10 valid_input = 0;
#10 valid_input = 1; input_value = 5'h06;	// 6
#10 valid_input = 0;
#10 valid_input = 1; input_value = 5'h00;	// 0
#10 valid_input = 0;
#10 valid_input = 1; input_value = 5'h12;	// =
#10 valid_input = 0;
#40 valid_input = 1; input_value = 5'h13;	// CL
#10 valid_input = 0;
#40 $stop;
end

initial begin
clk = 0;
	forever #5 clk = ~clk;
end

endmodule

