module SPY(CS,SCLK,SI,SO,count);
input SCLK,SI,CS;
output reg [7:0]SO;
reg [7:0]val=8'b0;
output reg [2:0]count=3'd0;

always @(posedge SCLK) begin
	if (~CS) begin
		if (SCLK)
			val[count] <= SI;
		end
end

always @(posedge SCLK) begin
		if (~CS) begin
			if (count==3'd7) count<=3'b0;
			else count <= count + 3'b1;
		end
end

always @(posedge SCLK) begin
		SO <= val;

end


endmodule
