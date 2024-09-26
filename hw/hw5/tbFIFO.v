module testbench();

reg [9:0]addr=10'b0;
wire [11:0]data;
ROM dut(addr,data);
integer i;

//$monitor("addr=$d,data=%d @ %d",addr,data,$time);


initial begin
#10
$display("Start of ROM test");
for(i=0;i<1024;i=i+1)begin
	$display("Address = %d - Data = %d",addr,data);
	addr=addr+1;
	#10;
end

$finish;

end

endmodule

