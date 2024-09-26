module testbench();

reg [3:0] Ra0,Ra1,Wa;
reg We,CLK;
reg [7:0]Wd;
wire [7:0]Rd0,Rd1;

rf mnp1(CLK,Ra0,Ra1,Wa,Wd,We,Rd0,Rd1);

always begin
	#5 CLK <=!CLK;
end

initial begin
$display("Start of the bcd adder test");
$monitor("Ra0=%d, Ra1=%d, Wa = %d, Wd=%d, We=%d, Rd0=%d,Rd1=%d, @ %d",Ra0,Ra1,Wa,Wd,We,Rd0,Rd1, $time);
$display("Setup");
CLK=0;
Wa = 3'b000; Wd = 8'd2; We = 1'b1; Ra0 = 3'b000; Ra1 = 3'b000;
#10

Wa = 3'b001; Wd = 8'd3; We = 1'b1;Ra0 = 3'b001; Ra1 = 3'b000;
#10

Wa = 3'b010; Wd = 8'd4; We = 1'b1;Ra0 = 3'b010; Ra1 = 3'b001;
#10

Wa = 3'b011; Wd = 8'd5; We = 1'b1;Ra0 = 3'b011; Ra1 = 3'b010;
#10

Wa = 3'b100; Wd = 8'd6; We = 1'b1;Ra0 = 3'b100; Ra1 = 3'b011;
#10

Wa = 3'b101; Wd = 8'd7; We = 1'b1;Ra0 = 3'b101; Ra1 = 3'b100;
#10

Wa = 3'b110; Wd = 8'd8; We = 1'b1;Ra0 = 3'b110; Ra1 = 3'b101;
#10

Wa = 3'b111; Wd = 8'd9; We = 1'b1;Ra0 = 3'b111; Ra1 = 3'b110;
#10
Wa = 3'b000; Wd = 8'd10; We = 1'b0;Ra0 = 3'b000; Ra1 = 3'b111;
#10
//$monitor("Ra0=%d, Ra1=%d, Wa = %d, Wd=%d, We=%d, Rd0=%d,Rd1=%d, @ %d",Ra0,Ra1,Wa,Wd,We,Rd0,Rd1, $time);
$display("Basic Read and Write");
Ra0 = 3'b000; Ra1 = 3'b000; Wa = 3'b001; Wd = 8'd1; We = 1'b1;
#10
Ra0 = 3'b001; Ra1 = 3'b001; Wa = 3'b010; Wd = 8'd2; We = 1'b1;
#10
Ra0 = 3'b010; Ra1 = 3'b001; Wa = 8'b011; Wd = 8'd3; We = 1'b1;
#10
Ra0 = 3'b010; Ra1 = 3'b011; Wa = 3'b000; Wd = 8'd4; We = 1'b1;
#10
Ra0 = 3'b000; Ra1 = 3'b000; Wa = 3'b000; Wd = 8'd0; We = 1'b0;
#10
$display("Bypass mode");
Ra0 = 3'b000; Ra1 = 3'b111; Wa = 3'b000; Wd = 8'd0; We = 1'b1;
#10
Ra0 = 3'b111; Ra1 = 3'b101; Wa = 3'b111; Wd = 8'd255; We = 1'b1;
#10
Ra0 = 3'b101; Ra1 = 3'b110; Wa = 3'b101; Wd = 8'd5; We = 1'b1;
#10
Ra0 = 3'b101; Ra1 = 3'b110; Wa = 3'b110; Wd = 8'd200; We = 1'b1;
#10

$display("Read Data No Write");
Ra0 = 3'b111; Ra1 = 3'b110; Wa = 3'b111; Wd = 8'd111; We = 1'b0;
#10
Ra0 = 3'b010; Ra1 = 3'b010; Wa = 3'b010; Wd = 8'd111; We = 1'b0;
#10
Ra0 = 3'b011; Ra1 = 3'b110; Wa = 3'b011; Wd = 8'd111; We = 1'b0;
#10
Ra0 = 3'b010; Ra1 = 3'b011; Wa = 3'b010; Wd = 8'd111; We = 1'b0;
#10

$display("Back to Write");
Ra0 = 3'b011; Ra1 = 3'b010; Wa = 3'b100; Wd = 8'd100; We = 1'b1;
#10
Ra0 = 3'b011; Ra1 = 3'b100; Wa = 3'b110; Wd = 8'd101; We = 1'b1;
#10
Ra0 = 3'b110; Ra1 = 3'b100; Wa = 3'b111; Wd = 8'd102; We = 1'b1;
#10
Ra0 = 3'b101; Ra1 = 3'b110; Wa = 3'b000; Wd = 8'd103; We = 1'b1;#10
Ra0 = 3'b111; Ra1 = 3'b000; Wa = 3'b000; Wd = 8'd0; We = 1'b0;
#10
$finish;
end

endmodule

