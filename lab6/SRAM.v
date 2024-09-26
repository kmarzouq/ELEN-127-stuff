module SRAM(Addr,re,we,data);
input [12:0]Addr;
input re,we; 
inout [7:0]data;
reg [7:0]SR[8191:0];

always @(posedge we) begin
	SR[Addr]=data;
end

assign data = (re==1'b1) ? SR[Addr] : 8'bzzzzzzzz;


endmodule
