module addsub(a,b,co,bo,add,sub);
input[3:0] a,b;
output[3:0] add,sub;
output co,bo;

assign {bo,sub}=a-b;
assign {co,add}=a+b;

endmodule

module test_addsub;
reg[3:0] a,b;
wire[3:0] add,sub;
wire co,bo;

addsub u1(a,b,co,bo,add,sub);

initial begin
a=4'd3;b=4'd1;
#10 a=4'd7;b=4'd10;
#10 $stop;
end
endmodule
