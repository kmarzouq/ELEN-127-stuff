module phase_accum(Clk,Rst,PhaseInc,Phase);
input [15:0] PhaseInc;
input Clk, Rst;
output reg [15:0] Phase;

always @(posedge Clk or Rst)begin
	if (Rst) Phase<=0;
	else Phase <= PhaseInc + Phase;
	end

endmodule

