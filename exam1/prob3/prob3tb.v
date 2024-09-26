module testbench();

reg dir,en,clk,rst;
wire [2:0]count;

updownsat dut(dir,en,clk,rst,count);

always begin
	#5 clk <=!clk;
end

initial begin
$display("Start of the  test");
$monitor("clk = %b, dir=%b, en=%b,  rst=%b, count=%d, @ %d",clk,dir,en,rst,count, $time);
$display("Setup");
clk=0;
dir = 1'b0; en = 1'b0; rst = 1'b1;
#10

$display("count up");
dir = 1'b1; en = 1'b1; rst = 1'b0;
#10
dir = 1'b1; en = 1'b1; rst = 1'b0;
#10
dir = 1'b1; en = 1'b1; rst = 1'b0;
#10
dir = 1'b1; en = 1'b1; rst = 1'b0;
#10
dir = 1'b1; en = 1'b1; rst = 1'b0;
#10
dir = 1'b1; en = 1'b1; rst = 1'b0;
#10
dir = 1'b1; en = 1'b1; rst = 1'b0;
#10
dir = 1'b1; en = 1'b1; rst = 1'b0;
#10
$display("count down");
dir = 1'b0; en = 1'b1; rst = 1'b0;
#10
dir = 1'b0; en = 1'b1; rst = 1'b0;
#10
dir = 1'b0; en = 1'b1; rst = 1'b0;
#10
dir = 1'b0; en = 1'b1; rst = 1'b0;
#10
dir = 1'b0; en = 1'b1; rst = 1'b0;
#10
dir = 1'b0; en = 1'b1; rst = 1'b0;
#10
dir = 1'b0; en = 1'b1; rst = 1'b0;
#10
dir = 1'b0; en = 1'b1; rst = 1'b0;
#10
dir = 1'b0; en = 1'b1; rst = 1'b0;
#10
$display("Setup for en testing");
dir = 1'b1; en = 1'b1; rst = 1'b0;
#10
dir = 1'b1; en = 1'b1; rst = 1'b0;
#10
dir = 1'b1; en = 1'b1; rst = 1'b0;
#10
$display("en testing");
dir = 1'b1; en = 1'b0; rst = 1'b0;
#10
dir = 1'b0; en = 1'b0; rst = 1'b0;
#10
$display("no count if rst=1 for incremenitng");
dir = 1'b1; en = 1'b1; rst = 1'b1;
#10
$display("Setup for decrementing");
dir = 1'b1; en = 1'b1; rst = 1'b0;
#10
dir = 1'b1; en = 1'b1; rst = 1'b0;
#10
dir = 1'b1; en = 1'b1; rst = 1'b0;
#10
$display("no count if rst=1");
dir = 1'b0; en = 1'b1; rst = 1'b1;
#10


$finish;
end

endmodule

