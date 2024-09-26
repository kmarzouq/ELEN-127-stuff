module prob1(A,B,C,D,E,X,Y);

    input A,B,C,D,E;
	output X,Y;
	wire ab,cd,de;


	assign ab = ~(A | B);
	assign cd = ~(C & D);
	assign de = D | E;
	assign y = ~(cd & de);
	assign x = ~(ab ^ ( ~cd));

endmodule 

