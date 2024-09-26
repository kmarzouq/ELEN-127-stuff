module bcdadd (A, B,Cin,BCD0,BCD1);
input [3:0]A;
input [3:0]B;
input Cin;
output reg [3:0]BCD0;
output reg [3:0]BCD1;

wire V1,V2;
wire [3:0] Sum1,Sum2;



adder4 add1 (A,B,Cin,V1,Sum1);

adder4 add2 (Sum1,4'b0110,1'b0,V2,Sum2);

always @(*) begin
	if ((Sum1 < 10)&(V1==0)) begin
		assign BCD0=Sum1;
		assign BCD1=4'b0000;
	end
	else if ((Sum1>9) | (V1 ==1)) begin
		assign BCD0=Sum2;
		assign BCD1=4'b0001;
	end
end




endmodule

