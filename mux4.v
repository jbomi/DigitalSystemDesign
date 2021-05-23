module mux4(a,b,c,d,s,y);
input[3:0] a,b,c,d;
input[1:0] s;
output[3:0] y;

assign y=(s==0)?a:(s==1)?b:(s==2)?c:d;

endmodule

module test_mux4;
reg[3:0] a,b,c,d;
reg[1:0] s;
wire[3:0] y;

mux4 u0(a,b,c,d,s,y);

initial begin
	a=4'd1;b=4'd6;c=4'd10;d=4'd15;s=2'd0;
#10	s=2'd0;
#10	s=2'd1;
#10 	s=2'd2;
#10	s=2'd3;
#10	$stop;
end
endmodule
