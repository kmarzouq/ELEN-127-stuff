module testbench();

reg CLKin,RST;
wire CLKout;
wire [2:0] count;

prob1 dut(CLKin,RST,CLKout);

always begin
	#5 CLKin <=!CLKin;
	$display("CLKin=%b,RST=%b,CLKout=%b,@ %d",CLKin,RST,CLKout,$time);
end

initial begin
$display("Start of the  test");
$display("Setup");
CLKin=1'b0;
RST=1'b1;
#10
$display("Start");
RST=1'b0;
#10
#10
#10
#10
#10
$display("Set High");
#10
#10
#10
#10
#10
$display("Set Low");
#10
#10
#10
#10
#10
$display("Set High");
#10
#10
#10
#10
#10
$display("Set Low");
#10
$display("Reset works");
RST=1'b1;
#10
RST=1'b0;
#10
#10
#10
#10
#10
$display("Set High");
#10


$finish;
end

endmodule

