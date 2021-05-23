module deco_3x8(a,y);

input[2:0] a;
output[7:0] y;

assign y[0]=~a[2]&~a[1]&~a[0];
assign y[1]=~a[2]&~a[1]& a[0];
assign y[2]=~a[2]& a[1]&~a[0];
assign y[3]=~a[2]& a[1]& a[0];
assign y[4]= a[2]&~a[1]&~a[0];
assign y[5]= a[2]&~a[1]& a[0];
assign y[6]= a[2]& a[1]&~a[0];
assign y[7]= a[2]& a[1]& a[0];

endmodule

module test_deco_3x8;
reg[2:0] a;
wire[7:0] y;

deco_3x8 deco(a,y);

initial begin
a=0;
#10 a=1;
#10 a=2;
#10 a=3;
#10 a=4;
#10 a=5;
#10 a=6;
#10 a=7;
#10 $stop;
end
endmodule

//21811957 jeongbomi 

