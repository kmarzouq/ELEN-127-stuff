module testbench();

reg [2:0] charval0;
reg [2:0] charval1;
reg [2:0] charval2;
reg [2:0] charval3;

wire [6:0] sega;
wire [6:0] segb;
wire [6:0] segc;
wire [6:0] segd;
wire [2:0] one;
wire [2:0] two;
wire [2:0] three;
wire [2:0] four;

reg [1:0] sel;

mux4to1 muxA (charval3,charval2,charval1,charval0,one,sel);
mux4to1 muxB (charval2,charval3,charval0,charval1,two,sel);
mux4to1 muxC (charval1,charval0,charval3,charval2,three,sel);
mux4to1 muxD (charval0,charval1,charval2,charval3,four,sel);

samuel c1 (one, sega);
samuel c2 (two, segb);
khondakar c3 (three, segc);
khondakar c4 (four, segd);

initial begin
	$display("Start of the decoder test");
	$monitor("sel = %d, charval0=%d, charval1=%d,charval2=%d,charval3=%d, sega=%b,segb=%b, segc=%b, segd=%b, @ %d", sel, charval0, charval1, charval2, charval3, sega, segb, segc, segd, $time);
charval0 = 3'd0; charval1 = 3'd1; charval2 = 3'd2; charval3 = 3'd3;
sel = 0;
#10
sel = 3'd1;
#10
sel = 3'd2;
#10
sel = 3'd3;
#10
charval0 = 3'd2; charval1 = 3'd1; charval2 = 3'd2; charval3 = 3'd1;
sel = 0;
#10
sel = 3'd1;
#10
sel = 3'd2;
#10
sel = 3'd3;
#10
charval0 = 3'd6; charval1 = 3'd1; charval2 = 3'd0; charval3 = 3'd7;
sel = 0;
#10
sel = 3'd1;
#10
sel = 3'd2;
#10
sel = 3'd3;
#10
charval0 = 3'd0; charval1 = 3'd1; charval2 = 3'd2; charval3 = 3'd3;
sel = 0;
#10
charval0 = 3'd1;
#10
charval0 = 3'd2;
#10
charval0 = 3'd3;
#10
charval1 = 3'd7;
#10
charval1 = 3'd6;
#10
charval1 = 3'd5;
#10
$finish;

end

endmodule

