module SPI(CS,SCLK,SI,SO,RST);
input SCLK,SI,CS;
output reg SO=1'b0;
output RST;


always @(negedge SCLK or RST) begin
		if (RST) SO<=1'b0;
		else if (~CS) SO<=SI;
		else SO<=1'bz;
end

endmodule


