module or_array(a,b,y);
input[3:0] a,b;
output[3:0] y;

or #(2) u0[3:0] (y,a,b);

endmodule
 
module test_or_array;

reg[3:0] a,b;
wire[3:0] y;

or_array u1(a,b,y);

initial begin
a=4'b0000;b=4'b0101;
#10 a=4'b1011; 
#10 a=4'b0011;b=4'b1001;
#10 $stop;
end

endmodule

