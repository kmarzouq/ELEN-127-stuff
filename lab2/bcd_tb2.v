module testbench();

reg [3:0] a0,a1,b0,b1;
reg c;
wire [3:0] bcd0, bcd1,bcd2;
wire [3:0] du;

bcdadd dig0(a0, b0, c, bcd0, du);
bcdadd dig1(a1, b1, du, bcd1, bcd2);


initial begin
	$display("Start of the bcd adder test");
	$monitor("a1=%d, a0=%d,b1=%d, b0=%d, cin = %d,bcd2=%d, bcd1=%d, bcd0=%d, @ %d", a1,a0, b1,b0, c, bcd2,bcd1, bcd0, $time);
a0=4'b0;a1=4'b0; b0=4'b0;b1=4'b0; c = 0;
#10
a1=4'd0;a0=4'd8; b1=4'd0;b0=4'd3;
#10
a1=4'd0;a0=4'd2; b1=4'd0;b0=4'd5;
#10
a1=4'd0;a0=4'd4; b1=4'd0;b0=4'd7;c=1;
#10
a1=4'd0;a0=4'd9; b1=4'd1;b0=4'd1;
#10
a1=4'd2;a0=4'd7; b1=4'd2;b0=4'd1;
#10
a1=4'd5;a0=4'd8; b1=4'd5;b0=4'd3;
#10
a1=4'd9;a0=4'd9; b1=4'd9;b0=4'd9;
#10
$display("End of the bcd adder test");
$finish;

end

endmodule

