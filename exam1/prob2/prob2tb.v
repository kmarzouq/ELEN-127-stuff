module testbench();

reg [7:0]X;
reg [2:0]R;
reg D;
wire [7:0]Y;
//prob2 dut(X,R,D,Y);
//prob21 dut(X,R,D,Y);
test dut(X,R,D,Y);
initial begin
$display("Start of the  test");
$monitor("X = %b, R=%d, D=%b,  Y=%b, @ %d",X,R,D,Y, $time);
$display("Setup");

X = 8'b10111101; R = 3'd3; D = 1'b0;
#10
X = 8'b10111101; R = 3'd3; D = 1'b1;
#10
X = 8'b10111101; R = 3'd7; D = 1'b0;
#10
X = 8'b10111101; R = 3'd7; D = 1'b1;
#10


$finish;
end

endmodule

