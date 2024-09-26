module testbench();
reg clk, rst, w;
wire z;
s101 dut(clk, rst, w, z);

always begin
#5 clk = ~clk;

#5 clk = ~clk;
end

initial begin
$monitor("clk=%b, rst =%b, w=%b, z=%b, @ %d", clk, rst, w, z, $time);
$display("Setup / testing reset");
clk = 0;

rst = 1'b1; w = 1'b0; #10
rst = 1'b0; w = 1'b0; #10
$display("Start of the 101 sequencer test");
$display("Testing recognition of sequence 101 from state 0");
$display("Also testing that 000, 001, 010, and 100 do not work");
rst = 1'b0; w = 1'b1; #10
rst = 1'b0; w = 1'b0; #10
rst = 1'b0; w = 1'b0; #10
rst = 1'b0; w = 1'b0; #10
rst = 1'b0; w = 1'b1; #10
rst = 1'b0; w = 1'b0; #10
rst = 1'b0; w = 1'b1; #10
$display("Testing reset to work after 101 has been recognized, even if w=1");
rst = 1'b1; w = 1'b1; #10
$display("Testing recognition of sequence 101 after 111 (state 1)");
$display("Also testing that 011 does not work");
rst = 1'b0; w = 1'b0; #10
rst = 1'b0; w = 1'b1; #10
rst = 1'b0; w = 1'b1; #10
rst = 1'b0; w = 1'b1; #10
rst = 1'b0; w = 1'b0; #10
rst = 1'b0; w = 1'b1; #10
$display("Reset");
rst = 1'b1; w = 1'b0; #10
$display("Testing recognition of sequence 101 after 110 (state 2)");
rst = 1'b0; w = 1'b0; #10
rst = 1'b0; w = 1'b1; #10
rst = 1'b0; w = 1'b1; #10
rst = 1'b0; w = 1'b0; #10
rst = 1'b0; w = 1'b1; #10

$finish;

end
endmodule
