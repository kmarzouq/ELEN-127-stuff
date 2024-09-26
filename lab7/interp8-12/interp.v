module Interpolator (one, two, Frac, Interpolated);
input [7:0] one, two;
input [8:0] Frac;
output [11:0] Interpolated;


//always @(*) begin
//	Interpolated[11:4] <= one; 
//	Interpolated[3:0] <= ((Frac*(two-one))>>5);
//end
/*
assign Interpolated[11:4] = (one<two) ? one : two;
assign Interpolated[3:0] = (one<two) ? ((Frac*(two-one))>>5) : ((Frac*(one-two))>>5);*/

assign Interpolated=(((Frac * two) + (((1<<9)-Frac) * one)) >> (8 + 9 - 12)) & ((1 << 12) - 1); 

endmodule

