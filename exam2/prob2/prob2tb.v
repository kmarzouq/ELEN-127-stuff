module testbench();


reg [7:0] din;
reg up, rst, clk, enb, load, rdb;
wire carry;
wire [7:0] dout;


precount dut(din, up, rst, clk, enb, load, rdb, carry, dout);

always begin
#5 clk = ~clk;
$display("din=%h, dout=%h, rst=%b, up=%b, enb=%b, load=%b, rdb=%b, carry=%b @%d", din, dout,rst, up, enb, load, rdb, carry, $time);
#5 clk = ~clk;
end


initial begin
	$display("Start of the test Preload Counter");

clk = 0;
rdb = 0;
rst = 1;
enb = 0;
#13
rst = 0 ;
up = 1; load = 0;  enb = 0; din <= 8'h11;
#10
up = 1; load = 0;  enb = 0; din <= 8'h11;
#10
up = 1; load = 1;  enb = 0; din <= 8'hfc;
#10
up = 1; load = 0;  enb = 0; din <= 8'h11;
#10
up = 1; load = 0;  enb = 0; din <= 8'h11;
#10
up = 1; load = 0;  enb = 0; din <= 8'h11;
#10
up = 1; load = 0;  enb = 0; din <= 8'h11;
#10
up = 1; load = 0;  enb = 1; din <= 8'h11;
#10
up = 1; load = 0;  enb = 0; din <= 8'h11;
#10
up = 1; load = 0;  enb = 0; din <= 8'h11;
#10
up = 0; load = 0;  enb = 0; din <= 8'h11;
#10
up = 0; load = 0;  enb = 0; din <= 8'h11;
#10
up = 0; load = 0;  enb = 0; din <= 8'h11;
#10
up = 0; load = 0;  enb = 1; din <= 8'h11;
#10
up = 0; load = 0;  enb = 0; din <= 8'h11;
#10
up = 0; load = 0;  enb = 0; din <= 8'h11;
#10
up = 0; load = 0;  enb = 0; din <= 8'h11;
#10
up = 0; load = 0;  enb = 0; din <= 8'h11;
#10
up = 1; load = 0;  enb = 0; din <= 8'h11;
#10
up = 1; load = 0;  enb = 0; din <= 8'h11;
#5
rdb = 1;#1
$display("din=%h, dout=%h, rst=%b, up=%b, enb=%b, load=%b, rdb=%b, carry=%b @%d", din, dout,rst, up, enb, load, rdb, carry, $time);
#25
rdb = 0;
up = 1; load = 0;  enb = 0; din <= 8'h11;
#50
$display("End of the test Preload Counter");
$finish;

end

endmodule



