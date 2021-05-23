module test;

reg a;

initial begin
	
	a = 0;
	#10 a = 1;
	#10 a = 0;
	#10 a = 1;

	#10 $stop;

end

endmodule
//21811957 jeongbomi
//2020.09.03