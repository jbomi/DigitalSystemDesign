module smb(clk,nrst,x,z);//21811957 jeongbomi
input clk,nrst, x;
output z;
parameter Zero=0, One=1, Two=2, Start=3;
reg[1:0] state;
always@(posedge clk or negedge nrst)begin
	if(!nrst)state<=Start;
	else begin
		case(state)
			Start:if(!x) state<=Zero;
			Zero:if(x) state<=One;
			One:if(x) state<=Two;
			    else state<=Zero;
			Two:if(x) state<=Start;
			    else state<=Zero;
		endcase
	end
end
wire z;
assign z=(state ==Two);
endmodule

module test_smb;
reg clk,nrst,x;
wire z;
smb smb1(clk,nrst,x,z);

initial begin
	nrst=0;x=0;
#10	nrst=1;
#20	x=1;
#10	x=0;
#10	x=1;
#20	x=0;
#15	$stop;
end

initial begin
clk=0;
forever begin
#5 clk=~clk;
end
end
endmodule
