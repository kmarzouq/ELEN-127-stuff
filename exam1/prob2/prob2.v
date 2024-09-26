module prob2(X,R,D,Y);

    input [7:0]X;
	input [2:0]R;
	input D;
	output reg [7:0]Y;
	

always @(*) begin
	Y = 8'b0;
	
	if (D==1) begin
		Y[0]=X[0+R];
		Y[1]=X[1+R];
		Y[2]=X[2+R];
		Y[3]=X[3+R];
		Y[4]=X[4+R];
		Y[5]=X[5-8+R];
		Y[6]=X[6-8+R];
		Y[7]=X[7-8+R];
	end
	else begin
		Y[0]=X[0+8-R];
		Y[1]=X[1+8-R];
		Y[2]=X[2+8-R];
		Y[3]=X[3-R];
		Y[4]=X[4-R];
		Y[5]=X[5-R];
		Y[6]=X[6-R];
		Y[7]=X[7-R];
	end
end
endmodule 

