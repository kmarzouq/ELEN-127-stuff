module prob1(CLKin,RST,CLKout);
input CLKin,RST;
output reg CLKout;
reg [2:0]count; 

always @(posedge CLKin or posedge RST) begin
	if(RST) count <= 3'b00;
	else if(CLKin && ~RST) begin
		if(count==3'b100) count <= 3'b0;
		else count <= count+1;
	end
end

always @(posedge CLKin or RST)begin
	if (RST) CLKout <=1'b0;
	else if (count[2] && ~RST) CLKout <= ~CLKout;
end

endmodule 

