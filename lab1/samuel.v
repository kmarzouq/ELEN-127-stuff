module samuel (In, Out);
	output reg [6:0] Out;
	input [2:0] In;

	always @(*) begin
	case (In)
		3'b000 : Out = 7'b1110111;
		3'b001 : Out = 7'b1111100;
		3'b010 : Out = 7'b0111001;
		3'b011 : Out = 7'b1011110;
		3'b100 : Out = 7'b1111001;
		3'b101 : Out = 7'b1110001;
		3'b110 : Out = 7'b1110110;
		3'b111 : Out = 7'b0001110; 
		default : Out = 7'b0000000;
	endcase end
endmodule
