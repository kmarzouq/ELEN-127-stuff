module testbench();

reg [0:3] mv;
reg RST,CLK;
wire [0:3]Out;
wire Imp,Win,Lose;

game dut(mv,CLK,RST,Out,Win,Imp, Lose);

always begin
	#5 CLK <=!CLK;
end

initial begin
$display("Start of the bcd adder test");
$monitor("CLK=%d, RST = %d, mv=%b, Out=%b, Win=%b, Lose=%b, Imp=%b @ %d",CLK,RST,mv,Out,Win,Lose,Imp, $time);
$display("Setup");
CLK=0;
mv=4'b0000;RST=1'b1;
#10
$display("Testing if it works");
mv=4'b1010;RST=1'b0;
#10
mv=4'b1000;RST=1'b0;
#10
mv=4'b0000;RST=1'b0;
#10
mv=4'b1100;RST=1'b0;
#10
mv=4'b1010;RST=1'b0;
#10
mv=4'b1001;RST=1'b0;
#10
mv=4'b1000;RST=1'b0;
#10
mv=4'b1010;RST=1'b0;
#10
$display("Testing reset override");
mv=4'b1000;RST=1'b1;
#10
$display("Testing Failure from start");
mv=4'b1000;RST=1'b0;
#10
mv=4'b0000;RST=1'b1;
#10
mv=4'b1100;RST=1'b0;
#10
mv=4'b0000;RST=1'b1;
#10
mv=4'b1001;RST=1'b0;
#10
mv=4'b0000;RST=1'b1;
#10
$display("Testing Other way for it to work");
mv=4'b1010;RST=1'b0;
#10
mv=4'b1000;RST=1'b0;
#10
mv=4'b1001;RST=1'b0;
#10
mv=4'b1010;RST=1'b0;
#10
mv=4'b1100;RST=1'b0;
#10
mv=4'b1000;RST=1'b0;
#10
mv=4'b1010;RST=1'b0;
#10
$display("Testing impossible inputs when moving multiple things");
mv=4'b1000;RST=1'b1;
#10
mv=4'b1011;RST=1'b0;
#10
mv=4'b1110;RST=1'b0;
#10
mv=4'b1101;RST=1'b0;
#10
mv=4'b1111;RST=1'b0;
#10
$display("Testing impossible inputs when moving something not on farmer's side");
mv=4'b1010;RST=1'b0;
#10
mv=4'b1001;RST=1'b0;
#10
mv=4'b1100;RST=1'b0;
#10
mv=4'b1000;RST=1'b0;
#10
mv=4'b1010;RST=1'b0;
#10
$display("Testing Lose conditions from 1110");
mv=4'b1010;RST=1'b1;
#10
mv=4'b1010;RST=1'b0;
#10
mv=4'b1000;RST=1'b0;
#10
mv=4'b1100;RST=1'b0;
#10
mv=4'b1000;RST=1'b0;
#10
$display("Testing Lose condition from 0100");
mv=4'b1010;RST=1'b1;
#10
mv=4'b1010;RST=1'b0;
#10
mv=4'b1000;RST=1'b0;
#10
mv=4'b1100;RST=1'b0;
#10
mv=4'b1010;RST=1'b0;
#10
mv=4'b1000;RST=1'b0;
#10
$display("Testing Lose condition from 1011");
mv=4'b1010;RST=1'b1;
#10
mv=4'b1010;RST=1'b0;
#10
mv=4'b1000;RST=1'b0;
#10
mv=4'b1001;RST=1'b0;
#10
mv=4'b1000;RST=1'b0;
#10
$display("Testing Lose condition from 0001");
mv=4'b1010;RST=1'b1;
#10
mv=4'b1010;RST=1'b0;
#10
mv=4'b1000;RST=1'b0;
#10
mv=4'b1001;RST=1'b0;
#10
mv=4'b1010;RST=1'b0;
#10
mv=4'b1000;RST=1'b0;
#10
$display("Testing if repeating inputs return to original state");
mv=4'b1010;RST=1'b1;
#10
mv=4'b1010;RST=1'b0;
#10
mv=4'b1010;RST=1'b0;
#10
mv=4'b1010;RST=1'b0;
#10
mv=4'b1000;RST=1'b0;
#10
mv=4'b1000;RST=1'b0;
#10
mv=4'b1000;RST=1'b0;
#10
mv=4'b1100;RST=1'b0;
#10
mv=4'b1100;RST=1'b0;
#10
mv=4'b1100;RST=1'b0;
#10
mv=4'b1010;RST=1'b0;
#10
mv=4'b1010;RST=1'b0;
#10
mv=4'b1010;RST=1'b0;
#10
mv=4'b1001;RST=1'b0;
#10
mv=4'b1001;RST=1'b0;
#10
mv=4'b1001;RST=1'b0;
#10
mv=4'b1000;RST=1'b0;
#10
mv=4'b1000;RST=1'b0;
#10
mv=4'b1000;RST=1'b0;
#10
mv=4'b1010;RST=1'b0;
#10
$display("Testing if repeating inputs return to original state for the other way");
mv=4'b1010;RST=1'b1;
#10
mv=4'b1010;RST=1'b0;
#10
mv=4'b1000;RST=1'b0;
#10
mv=4'b1001;RST=1'b0;
#10
mv=4'b1001;RST=1'b0;
#10
mv=4'b1001;RST=1'b0;
#10
mv=4'b1010;RST=1'b0;
#10
mv=4'b1010;RST=1'b0;
#10
mv=4'b1010;RST=1'b0;
#10
mv=4'b1100;RST=1'b0;
#10
mv=4'b1100;RST=1'b0;
#10
mv=4'b1100;RST=1'b0;
#10
mv=4'b1000;RST=1'b0;
#10
mv=4'b1000;RST=1'b0;
#10
mv=4'b1000;RST=1'b0;
#10
mv=4'b1010;RST=1'b0;
#10
$finish;
end

endmodule

