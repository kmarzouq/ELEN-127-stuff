module testbench();

reg RST,CLK,Push,Pop;
reg [7:0] Din;
wire [7:0]Dout;
wire Full,Empty;
wire [3:0]head,tail;
wire [3:0] ctr;
FIFO dut(CLK,Din,Push,Pop,RST,Dout,Full,Empty);

always begin
	#5 CLK <=!CLK;
	$display("CLK=%b, Din=%d ,Push=%b ,Pop=%b ,RST=%b ,Dout=%d ,Full=%b, Empty=%b, @ %d",CLK,Din,Push,Pop,RST,Dout,Full,Empty,$time);
end

initial begin
$display("Start of FIFO test");

$display("Setup");
CLK=0;
RST=1'b1;
#10
$display("Loading values into FIFO stack");
RST=1'b0;
Din=8'd1;Push=1'b1; Pop = 1'b0;
#10
$display("Checking if Push and Pop work at same time");
Din=8'd2;Push=1'b1; Pop = 1'b1;
#10
Din=8'd3;Push=1'b1; Pop = 1'b0;
#10
Din=8'd4;Push=1'b1; Pop = 1'b0;
#10
Din=8'd5;Push=1'b1; Pop = 1'b0;
#10
Din=8'd6;Push=1'b1; Pop = 1'b0;
#10
Din=8'd7;Push=1'b1; Pop = 1'b0;
#10
Din=8'd8;Push=1'b1; Pop = 1'b0;
#10
Din=8'd9;Push=1'b1; Pop = 1'b0;
#10
$display("Checking if not doing push or pop works");
Push=1'b0;Pop=1'b0;
#10
Din=8'd10;Push=1'b1; Pop = 1'b0;
#10
$display("Checking if consecutive push and pops work");
Din=8'd11;Push=1'b1; Pop = 1'b1;
#10
Din=8'd12;Push=1'b1; Pop = 1'b1;
#10
Din=8'd13;Push=1'b1; Pop = 1'b0;
#10
$display("Checking if being full stop pushing values");
Din=8'd14;Push=1'b1; Pop = 1'b0;
#10
Din=8'd15;Push=1'b1; Pop = 1'b0;
#10
Din=8'd16;Push=1'b1; Pop = 1'b0;
#10
$display("Checking if pushing and popping works when full");
Din=8'd17;Push=1'b1; Pop = 1'b1;
#10
$display("Popping till empty");
Din=8'd18;Push=1'b0; Pop = 1'b1;
#10
Din=8'b0;Push=1'b0; Pop = 1'b1;
#10
Din=8'b0;Push=1'b0; Pop = 1'b1;
#10
Din=8'b0;Push=1'b0; Pop = 1'b1;
#10
Din=8'b0;Push=1'b0; Pop = 1'b1;
#10
Din=8'b0;Push=1'b0; Pop = 1'b1;
#10
Din=8'b0;Push=1'b0; Pop = 1'b1;
#10
Din=8'b0;Push=1'b0; Pop = 1'b1;
#10
Din=8'b0;Push=1'b0; Pop = 1'b1;
#10
Din=8'b0;Push=1'b0; Pop = 1'b1;
#10
Din=8'b0;Push=1'b0; Pop = 1'b1;
#10
Din=8'd20;Push=1'b1; Pop = 1'b1;
#10
$display("Checking if you can push data in after Empty");
Din=8'd21;Push=1'b1; Pop = 1'b0;
#10
Din=8'd20;Push=1'b0; Pop = 1'b1;
#10
$display("Checking if Pushing and Popping works when Empty");
Din=8'd20;Push=1'b0; Pop = 1'b1;
#10
$display("Checking if Reset works");
RST=1'b1;
#10
Din=8'd20;Push=1'b0; Pop = 1'b1;
#10
$display("Checking if you can't pop when empty");
Din=8'd20;Push=1'b0; Pop = 1'b1; RST=1'b0;
#10
$display("Checking if you can push and pop after");
Din=8'd25;Push=1'b1; Pop = 1'b0;
#10
Din=8'd25;Push=1'b0; Pop = 1'b1;
#10
Din=8'd25;Push=1'b0; Pop = 1'b0;
#10
Din=8'd25;Push=1'b0; Pop = 1'b0;
#10
$finish;

end

endmodule

