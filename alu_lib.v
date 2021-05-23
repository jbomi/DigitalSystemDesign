module mux_4bit(y, i0, i1, s);
output [3:0] y;
input [3:0] i0, i1;
input s;

assign y = s ? i1 : i0;

endmodule

module adder_4bit(a,b,s,ci,co);
input [3:0] a, b;
output [3:0] s;
input ci;
output co;

assign {co, s} = a + b + ci;

endmodule


