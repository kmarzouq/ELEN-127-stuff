module rf8 (ra,wa,din,we,clk,rst,dout);

input ra,wa,wen;
input [7:0] din;
input clk,rst;
output reg [7:0] dout;

reg [7:0] r [7:0];

alwyas @(posedge clk) begin
	if (w) begin
		case (wa) 
			0: r[0] <= din;
			1: r[1] <= din;
			2: r[2] <= din;
			3: r[3] <= din;
			4: r[4] <= din;
			5: r[5] <= din;
			6: r[6] <= din;
			7: r[7] <= din;
		endcase
	end
end

always@(*) begin
	dout <= r[ra];
end
endmodule
