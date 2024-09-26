module fifo(push,pop,clk,rst,din, dout,full, empty);

input push,pop,clk,rst;
input [7:0] din;
output [7:0] dout;
output full,empty;

reg [2:0] head,tail;
wire we;

rf rf1(tail,head,din,we,clk,dout);

assign we = (push & !full);
always @(posedge clk) begin
	if (rst) begin
		head <= 0;
		tail <= 0;
	end
	else begin
	if (push & !full) begin
		head <= head + 1;
	end
	if (pop & !empty) begin
	tail <= tail +1;
	end
end

endmodule
