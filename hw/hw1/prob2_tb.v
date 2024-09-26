module testbench2();

reg CLK,CLRN;

reg [15:0] InP;
wire [15:0] outP;
reg [1:0] Swi;
reg L,R;
wire Ol,Or;

r16eg reggy (CLK,CLRN,L,R,InP,Swi,outP,Ol,Or);

initial begin
	$display("Start of the comp test");
	$monitor("CLK=%b, CLRN=%b,L=%b,R=%b,InP=%b,Swi=%b,outP=%b,Ol=%b,Or=%b @ %d", CLK, CLRN,L,R,InP,Swi,outP,Ol,Or, $time);

CLRN = 1'b0;
L=0;
R=0;
InP= 8'b0000000000000001;
Swi = 2'b00;
CLK = 1'b0;

InP = 8'b0000000000000000;
#10
CLK = 1'b1;
#10
CLK = 1'b0;
InP = 16'b1111111111111111;

#10
CLK = 1'b1;
#10
CLK = 1'b0;
Swi = 2'b11;

#10
CLK = 1'b1;
#10
CLK = 1'b0;
InP = 8'b0000000000000000;
Swi = 2'b00;

#10
CLK = 1'b1;
#10
CLK = 1'b0;
Swi = 2'b10;

#10
CLK = 1'b1;
#10
CLK = 1'b0;
Swi = 2'b01;

#10
CLK = 1'b1;
#10
CLK = 1'b0;
Swi = 2'b01;

#10
CLK = 1'b1;
#10
CLK = 1'b0;
Swi = 2'b10;

#10
CLK = 1'b1;
#10
CLK = 1'b0;
CLRN = 1'b1;

#10
CLK = 1'b1;
#10
CLK = 1'b0;
$finish;

end

endmodule

