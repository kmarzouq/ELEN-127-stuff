module updownsat(dir,en,clk,rst,count);

    input dir,en,clk,rst;
	output reg [2:0]count;

`define upper 7
`define lower 0
	

always @(posedge clk) begin
	if (rst) count<=0;
	else begin
		if (en) begin
			if (dir) begin
				if (count< `upper) count <=count+1;
	end
	else begin
		if (count > `lower) count <= count-1;
	end
end
end
end
endmodule;

