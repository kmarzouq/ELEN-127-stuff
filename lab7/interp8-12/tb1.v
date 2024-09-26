module circuit1();
wire [15:0] PhaseIn;
reg Load, Clk, Rst;
wire [15:0] PhaseOut, Phase;
wire [8:0] Phaser;
wire [6:0] Phasel;
wire [7:0] lower, higher;
wire [11:0] Interpolated;
integer fd, i;

phase_reg phreg(PhaseIn, Load, Clk, PhaseOut);
phase_accum phacc(Clk, Rst, PhaseOut, Phase);
Rounder round(Phase, Phasel, Phaser); 
ROMs one(Phasel, lower);
ROMs two(Phasel+ 1 /*(1 << 9)*/, higher);
Interpolator inter(lower, higher, Phaser, Interpolated);

assign PhaseIn = ((9'b100000000 * 9'b100000000)/100);

/*
always begin
	#5 Clk <= !Clk;
end  */

initial begin
	$readmemh("wt.txt", one.entries);
	$readmemh("wt.txt", two.entries);
	fd = $fopen("outwave1.txt", "w");
	Clk = 0; #5;
	Clk=1; 	
	Load = 1; #5 
	Rst =1;
	#5 

	for(i = 0; i < 200; i=i+1) begin
		Clk = 1; #5
		Rst=0;
		$fwrite(fd, "%d\n",Interpolated);
		$display( "%d, %d\n", Phase>>8,Interpolated);
		Clk = 0; #5;
	end
	$fclose(fd);
	$finish;
end
endmodule

