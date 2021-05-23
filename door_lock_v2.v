module door_lock_v2 (clk,reset,valid_in,key_in,door_open);
input reset,clk,valid_in;
input[3:0] key_in;
output door_open; 

reg[15:0] in_reg;//21811957 jeongbomi
always@(posedge clk or posedge reset)begin
if(reset)in_reg<=16'hffff;
else if(valid_in)begin
if(key_in!==10 && key_in!==11)
in_reg<={in_reg[11:0],key_in};
else
in_reg<=16'hffff;
end
end

reg[15:0] passwd;
always@(posedge clk or posedge reset)begin
if(reset)passwd<=16'h2490;
else if(valid_in)begin
if(key_in==11 && door_open==1)
passwd<=in_reg;
end
end

reg door_open;
always@(posedge clk or posedge reset)begin
if(reset)door_open<=0;
else if(valid_in==1 && key_in==10)begin
if(in_reg==passwd)door_open<=1;
else door_open<=0;
end
end
endmodule

module test_door_lock_v2;

reg clk, reset;
reg valid_in;
reg[3:0] key_in;

wire door_open;

door_lock_v2 u1(clk, reset, valid_in, key_in, door_open);

initial begin
	reset = 1; valid_in = 0; key_in = 0;
#10	reset = 0;

// open door

#10	valid_in = 1; key_in = 2;
#10	valid_in = 0;

#10	valid_in = 1; key_in = 4;
#10	valid_in = 0;

#10	valid_in = 1; key_in = 9;
#10	valid_in = 0;

#10	valid_in = 1; key_in = 0;
#10	valid_in = 0;

#10	valid_in = 1; key_in = 10;
#10	valid_in = 0;

// change passwd

#100	valid_in = 1; key_in = 2;
#10	valid_in = 0;

#10	valid_in = 1; key_in = 1;
#10	valid_in = 0;

#10	valid_in = 1; key_in = 1;
#10	valid_in = 0;

#10	valid_in = 1; key_in = 4;
#10	valid_in = 0;

#10	valid_in = 1; key_in = 11;
#10	valid_in = 0;


// close door


#100	valid_in = 1; key_in = 10;
#10	valid_in = 0;


// open door

#100	valid_in = 1; key_in = 2;
#10	valid_in = 0;

#10	valid_in = 1; key_in = 1;
#10	valid_in = 0;

#10	valid_in = 1; key_in = 1;
#10	valid_in = 0;

#10	valid_in = 1; key_in = 4;
#10	valid_in = 0;

#10	valid_in = 1; key_in = 10;
#10	valid_in = 0;


// close door


#50	valid_in = 1; key_in = 10;
#10	valid_in = 0;


#100	$stop;

end


initial begin
	clk = 0;
	forever #5 clk = ~clk;
end

endmodule

