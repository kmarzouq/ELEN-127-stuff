module SPI(CS,SCLK,SI,SO,val1,val2);
input SCLK,SI,CS;
output reg SO=1'b0;
reg sw=1'b0;
output reg val1=1'b0,val2=1'b0;

always @(posedge SCLK ) begin
		if (~CS) begin
		if (sw) val1 <= SI;
		else if (~sw) val2 <= SI;
		end
end

always @(negedge SCLK ) begin
		if (~CS) sw <= ~sw;

	if (~CS)begin
		if(sw) SO<=val2;
		else if(~sw) SO<=val1;end
	else SO<=1'bz;
		

end


endmodule
