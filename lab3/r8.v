module r8eg (CLK,In,Ld,Out);
	input CLK,Ld;
	input [7:0]In;
	output reg [7:0] Out;
	
always @(posedge CLK) begin
	if (Ld) begin
		Out = In;
	end
end

	
endmodule
