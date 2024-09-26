module turn (CLK,D,RST,state);
input CLK,RST;//clock and reset
input [1:0] D; //direction of turn signal
output reg [5:0] state; // L_outer, L_middle, L_inner, R_inner, R_middle, and R_outer.

	
always @(posedge CLK) begin
	if (D==2'b00 | D==2'b11 | RST==1'b1) state = 6'b0;
	else if (D==2'b01) begin
		case (state)
			6'b000000: state = 6'b000100;
			6'b001000: state = 6'b000100;
			6'b011000: state = 6'b000100;
			6'b111000: state = 6'b000100;
			6'b000100: state = 6'b000110;
			6'b000110: state = 6'b000111;
			6'b000111: state = 6'b000100;
		endcase
	end
	else if (D==2'b10) begin
		case (state)
			6'b000000: state = 6'b001000;
			6'b000100: state = 6'b001000;
			6'b000110: state = 6'b001000;
			6'b000111: state = 6'b001000;
			6'b001000: state = 6'b011000;
			6'b011000: state = 6'b111000;
			6'b111000: state = 6'b001000;
		endcase
	end
end

	
endmodule
