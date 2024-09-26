module r8eg (CLK,CLRN,L,R,InP,Swi,outP,Ol,Or);
	input CLK;
	input CLRN;
	input L,R;
	input [7:0] InP;
	input [1:0] Swi;
	output [7:0] outP;
	output Ol, Or;

	reg [7:0] curr;
	assign Or = curr[0];
	assign Ol = curr[7];

	always @(posedge CLK or negedge CLRN)begin
		if (CLRN)
			curr <= 8'b0;
		else if (Swi == 2'b00)
			curr <= curr;
		else if (Swi == 2'b11)
			curr <= InP;
		else if (Swi == 2'b10)
			curr <= {L,curr[6:0]};
		else if (Swi == 2'b01)
			curr <= {curr[7:1],R};
			
	end

	assign outP = curr;

endmodule
