module ROMs (Address, Waveform);
input [6:0] Address;
output reg [7:0] Waveform;

reg [7:0] entries [0:127];

always @(*) begin
	Waveform = entries[Address];
end

endmodule


