module testbench();

reg [3:0] wra,ra;
reg RST,CLK,wren;
reg [7:0] wrd;
wire [7:0]out;

r12eg dut(CLK,RST,wrd,wra,wren,ra,out);

always begin
	#5 CLK <=!CLK;
end

initial begin
$display("Start of the bcd adder test");
$monitor("CLK=%d, RST = %d, wrd=%b ,wra=%d,wren=%b ,ra=%d ,out=%b @ %d",CLK,RST,wrd,wra,wren,ra,out, $time);
$display("Setup");
CLK=0;
RST=1'b1;
#10
RST=1'b0;wrd=8'b11011011;wra=0;ra=2;wren=1;
#10
RST=1'b0;wrd=8'b11110000;wra=1;ra=0;
#10
RST=1'b0;wrd=8'b00001111;wra=2;ra=1;
#10
RST=1'b0;wrd=8'b11111111;wra=0;ra=0;
#10
RST=1'b0;wrd=8'b10101010;wra=5;ra=2;
#10
RST=1'b0;wrd=8'b10100000;wra=11;ra=2;
#10
RST=1'b0;wrd=8'b00001110;wra=10;ra=11;
#10
RST=1'b0;wrd=8'b00001110;wra=9;ra=15;
#10
RST=1'b1;
#10
$finish;
end

endmodule

