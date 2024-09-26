module testbench();

reg G;
reg L;
reg E;

reg [7:0] val0;
reg [7:0] val1;

wire G1,L1,E1;

b8Comp upp8 (val0,val1,L,E,G,L1,E1,G1);

initial begin
	$display("Start of the comp test");
	$monitor("charval0=%d, charval1=%d, G=%d,E=%d,L=%d, @ %d", val0, val1, G1,E1,L1, $time);
G = 1'b0;
L = 1'b0;
E = 1'b0;
val0 = 8'b01001111; val1 = 8'b01111000;
#10
val0 = 8'b11001111; val1 = 8'b01111000;
#10
val0 = 8'b11001111; val1 = 8'b11001111;
#10
$finish;

end

endmodule

