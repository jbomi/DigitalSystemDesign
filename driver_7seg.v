module driver_7seg(s,a,b,c,d,e,f,g);
input[3:0] s;
output a,b,c,d,e,f,g;

assign a=(s==0)||(s==2)||(s==3)||(s==5)||(s==6)||(s==7)||(s==8)||(s==9);
assign b=(s==0)||(s==1)||(s==2)||(s==3)||(s==4)||(s==7)||(s==8)||(s==9);
assign c=(s==0)||(s==1)||(s==3)||(s==4)||(s==5)||(s==6)||(s==7)||(s==8)||(s==9);
assign d=(s==0)||(s==2)||(s==3)||(s==5)||(s==6)||(s==8)||(s==9);
assign e=(s==0)||(s==2)||(s==6)||(s==8);
assign f=(s==0)||(s==4)||(s==5)||(s==6)||(s==7)||(s==8)||(s==9);
assign g=(s==2)||(s==3)||(s==4)||(s==5)||(s==6)||(s==8)||(s==9)||(s==10)||(s==11)||(s==12)||(s==13)||(s==14)||(s==15);

endmodule

module test_driver_7seg;
reg[3:0] s;
wire a,b,c,d,e,f,g;

driver_7seg seg(s,a,b,c,d,e,f,g);

initial begin
	s=0;
#10	s=1;
#10	s=2;
#10	s=3;
#10 	s=4;
#10	s=5;
#10	s=6;
#10	s=7;
#10	s=8;
#10	s=9;
#10	s=10;
#10	s=11;
#10	s=12;
#10	s=13;
#10	s=14;
#10	s=15;
#10	$stop;
end

endmodule//21811957 jeongbomi_hw9

