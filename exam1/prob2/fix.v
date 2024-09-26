module prob21(X,R,D,Y);

    input [7:0]X;
	input [2:0]R;
	input D;
	output reg [7:0]Y;
	wire [7:0] temp;
	

always @(*) begin
	if (D==1) begin
		temp = {X[7:R],X[R:0]};
	end
	else begin
		temp = {X[R:0],X[7:R]};
	end
	assign Y = temp;
end
endmodule 

