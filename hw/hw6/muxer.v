module m32ux(in,sel,out);
input [31:0]in;
input [4:0]sel;
output out;

assign out=in[sel];

endmodule
