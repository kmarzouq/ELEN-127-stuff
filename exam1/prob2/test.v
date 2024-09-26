module test(X,R,D,Y);

    input [7:0]X;
	input [2:0]R;
	input D;
	output reg [7:0]Y;
	integer i;
	reg temp;

always @(*) begin
	Y = X;
	if (D==1) begin
		for (i=0; i<R;i=i+1)begin
			temp = Y[0];
			Y = Y>>1;
			Y[7]=temp;
		end
	end
	else begin
		for (i=0; i<R;i=i+1)begin
			temp = Y[7];
			Y = Y<<1;
			Y[0]=temp;
		end
	end
		
	
end
endmodule 

