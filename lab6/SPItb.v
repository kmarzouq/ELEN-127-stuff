module testbench();

reg SCLK,SI,CS;
wire [7:0]SO;
wire SOu;
wire [2:0]count;


SPI dut1 (CS,SCLK,SI,SOu);
SPY dut2 (CS,SCLK,SOu,SO,count);

always begin
	#5 SCLK <=!SCLK;
	$display("SCLK=%b,SI=%b, SOu=%b,SO=%b,count=%d @ %d",SCLK,SI,SOu,SO,count,$time);
end

initial begin
$display("Start SRAM test");

SCLK=0;
CS=0;
$display("Start ");
SI=1'b0; #10
SI=1'b1; #10
SI=1'b0; #10
SI=1'b1; #10
SI=1'b0; #10
SI=1'b1; #10
SI=1'b0; #10
SI=1'b1; #10

$display("Second load");
SI=1'b0; #10
SI=1'b0; #10
SI=1'b1; #10
SI=1'b1; #10
SI=1'b0; #10
SI=1'b0; #10
SI=1'b1; #10
SI=1'b1; #10

$display("Third load");
SI=1'b1; #10 
SI=1'b1; #10
SI=1'b1; #10
SI=1'b1; #10 
SI=1'b0; #10
SI=1'b0; #10
SI=1'b0; #10
SI=1'b0; #10
SI=1'b0; #10
SI=1'b0; #10
$finish;
end

endmodule

