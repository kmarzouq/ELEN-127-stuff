module testbench();

reg [12:0] Addr;
reg re,we;
wire [7:0]data;

reg [7:0]din;
assign data=din;

SRAM dut(Addr,re,we,data);


initial begin
$display("Start SRAM test");
$monitor("Addr=%d,re=%b,we=%b,data=%d,din=%d, @ %d",Addr,re,we,data,din, $time);
din=8'b0;
#10
re=1'b0;we=1'b1;Addr=13'd35;din= 8'd19;
#10
re=1'b0;we=1'b1;Addr=13'd45;din= 8'd26;
#10
re=1'b1;we=1'b0;Addr=12'd35;din=8'bzzzzzzzz;
#10
re=1'b1;we=1'b0;Addr=12'd45;din=8'bzzzzzzzz;
#10
re=1'b0;we=1'b1;Addr=12'd55;din =8'd100;
#10
re=1'b1;we=1'b0;Addr=12'd55;din=8'bzzzzzzzz;
#10
re=1'b0;we=1'b0;Addr=12'd55;
#10
$finish;
end

endmodule

