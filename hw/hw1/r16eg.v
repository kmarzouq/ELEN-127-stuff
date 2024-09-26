module r16eg (CLK,CLRN,L,R,InP,Swi,outP,Ol,Or);
	input CLK;
	input CLRN;
	input L,R;
	input [15:0] InP;
	input [1:0] Swi;
	output [15:0] outP;
	output Ol, Or;

	wire [15:0] curr;
	wire l1,r1;

	

	r8eg reggy1 (CLK,CLRN,r1,R,InP[7:0],Swi,curr[7:0],l1,Or);
	r8eg reggy2 (CLK,CLRN,L,l1,InP[15:8],Swi,curr[15:8],Ol,r1);
	assign outP = curr;

endmodule
