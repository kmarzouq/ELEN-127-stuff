module testbench();

reg [1:0] D;
reg RST,CLK;
wire [5:0]Out;

turn dut(CLK,D,RST,Out);

always begin
	#5 CLK <=!CLK;
end

initial begin
$display("Start of the bcd adder test");
$monitor("CLK=%d, D=%b, RST = %d, Out=%b, @ %d",CLK,D,RST,Out, $time);
$display("Setup");
CLK=0;
D=2'b00;RST=1'b1;
#10
$display("Going straight");
D=2'b00;RST=1'b0;
#10
D=2'b11;RST=1'b0;
#10
$display("Right turn loop");
D=2'b01;RST=1'b0;
#10
D=2'b01;RST=1'b0;
#10
D=2'b01;RST=1'b0;
#10
D=2'b01;RST=1'b0;
#10
$display("Reset overrides right turn");
D=2'b01;RST=1'b1;
#10
$display("Left turn loop");
D=2'b10;RST=1'b0;
#10
D=2'b10;RST=1'b0;
#10
D=2'b10;RST=1'b0;
#10
D=2'b10;RST=1'b0;
#10
$display("Reset overrides left turn");
D=2'b10;RST=1'b1;
#10
$display("Right turn to left turn and back");
D=2'b01;RST=1'b0;
#10
D=2'b01;RST=1'b0;
#10
D=2'b10;RST=1'b0;
#10
D=2'b10;RST=1'b0;
#10
D=2'b01;RST=1'b0;
#10
$display("Going straight");
D=2'b00;RST=1'b0;
#10
$finish;
end

endmodule

