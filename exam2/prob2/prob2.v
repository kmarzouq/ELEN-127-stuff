module precount(din, up, rst, clk, enb, load, rdb, carry, dout);

    input [7:0]din;
	input clk,rst,up,load,enb,rdb;
	output reg [7:0]dout;
	output reg carry;
	reg  [7:0]count;

always @(posedge clk) begin
	if (load && ~rst) count=din;
end	
always @(*) begin
	if (rdb) dout=8'bzzzzzzzz;
	else dout = count;
end

always @(posedge clk) begin
	if ((8'd255==count && (count+8'b1 == 8'b0))&& up) carry=1'b1;
	else carry = 1'b0;
end

always @(posedge clk) begin
	if (rst)begin
		dout <=8'b0;
		carry <= 1'b0;
		count <= 8'b0;
	end
	
	else if (~enb && ~load && ~rst) begin
		if (up) begin
			
			count<=count+8'd1;
			end

		else begin
			count<=count-8'd1;
			end

	end
		

end
endmodule 

