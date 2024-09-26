module bcd_adder (A, B, Cin, BCD1, BCD0);

input [3:0] A, B;
input Cin;
output reg [3:0] BCD1, BCD0;

wire Cout, conv_Cout;
wire [3:0] Sum, conv_Remainder;
reg Overflow_cond;

adder4 normal (A, B, Cin, Cout, Sum);
adder4 conversion (Sum, 4'b0110, 1'b0, conv_Cout, conv_Remainder); 
assign Overflow_cond = Sum[3] && (Sum[2] || Sum[1]) || Cout;
assign BCD0 = Overflow_cond ? Sum : conv_Remainder;
assign BCD1 = Overflow_cond? 4’b0000 : 4’b0001;

endmodule

