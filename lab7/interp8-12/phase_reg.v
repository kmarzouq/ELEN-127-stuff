module phase_reg (PhaseIn, Load, Clk,PhaseOut);
input [15:0] PhaseIn;
input Load, Clk;
output reg [15:0]PhaseOut;

always @(posedge Clk) begin
	if (Load) PhaseOut<=PhaseIn;
	end

endmodule




