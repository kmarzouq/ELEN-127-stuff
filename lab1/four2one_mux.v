module mux4to1 (In0, In1, In2, In3, Out, Sig);
output [2:0] Out;
input [2:0] In0;
input [2:0] In1;
input [2:0] In2;
input [2:0] In3;
input [1:0] Sig;
reg [2:0] Out;
always @(*)
case (Sig)
3'b00 : Out = In0;
3'b01 : Out = In1;
3'b10 : Out = In2;
3'b11 : Out = In3;
endcase
endmodule
