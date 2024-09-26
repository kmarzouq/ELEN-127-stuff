module s101(clk, rst, w, z);

input clk, rst, w;
output z;

reg [3:0] cs, ns;

parameter [3:0] A = 4'b0001, B = 4'b0010, C = 4'b0100, D = 4'b1000;

always @(posedge clk) begin
  if (rst) cs <= A;
  else cs <= ns;
end

always @(*) begin
  case (cs)
	A:	if (w) ns = B;
		else ns = A;
	B:	if (w) ns = B;
		else ns = C;
	C:	if (w) ns = D;
		else ns = A;
	D:	if (w) ns = B;
		else ns = C;
  endcase
end

assign z = (cs == D);

endmodule

