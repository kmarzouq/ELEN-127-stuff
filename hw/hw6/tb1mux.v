module testbench();

reg [31:0]in=32'b11110000101001010011001111001100;
reg [4:0]sel=0;
wire out;
m32ux dut(in,sel,out);
integer i;

//$monitor("addr=$d,data=%d @ %d",addr,data,$time);


initial begin
#10
$display("Start of mux test");
for(i=0;i<32;i=i+1)begin
	$display("%d",out);
	sel=sel+1;
	#10;
end

$finish;

end

endmodule

