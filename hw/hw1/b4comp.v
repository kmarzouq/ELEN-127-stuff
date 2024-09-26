module b4Comp(A,B,LIN,EIN,GIN,L,E,G);
    input [3:0] A;
    input [3:0] B; 
    input LIN; 
    input EIN; 
    input GIN; 
    output reg L;
    output reg E;
    output reg G;

always @ (*) 
	if ((EIN == 1)|((GIN==0)&(LIN==0)))begin
    	assign L = (A < B); 
    	assign E = (A == B);
    	assign G = (A > B);
	end 
	else if (GIN == 1) begin
		assign L = 1'b0;
    	assign E = 1'b0;
    	assign G = 1'b1;
	end 
	else if (LIN == 1) begin
		assign L = 1'b1;
    	assign E = 1'b0;
    	assign G = 1'b0;
end
endmodule 

