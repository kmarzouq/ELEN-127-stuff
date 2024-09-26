module r12eg(CLK,RST,wrd,wra,wren,ra,out);

input CLK,RST,wren;
input [7:0]wrd;
input [3:0]wra,ra;
reg [7:0]r0eg;
reg [7:0]r1eg;
reg [7:0]r2eg;
reg [7:0]r3eg;
reg [7:0]r4eg;
reg [7:0]r5eg;
reg [7:0]r6eg;
reg [7:0]r7eg;
reg [7:0]r8eg;
reg [7:0]r9eg;
reg [7:0]r10eg;
reg [7:0]r11eg;
output reg [7:0]out;

always @(posedge CLK) begin
	if(RST==1'b1)begin
		r0eg=8'b0;
		r1eg=8'b0;
		r2eg=8'b0;
		r3eg=8'b0;
		r4eg=8'b0;
		r5eg=8'b0;
		r6eg=8'b0;
		r7eg=8'b0;
		r8eg=8'b0;
		r9eg=8'b0;
		r10eg=8'b0;
		r11eg=8'b0;
		out=8'b0;
	end
	
	else begin
		if (wren==1'b1) begin//r12eg[wra]=wrd;
			case(wra)
				4'd0 : r0eg<=wrd;
				4'd1 : r1eg<=wrd;
				4'd2 : r2eg<=wrd;
				4'd3 : r3eg<=wrd;
				4'd4 : r4eg<=wrd;
				4'd5 : r5eg<=wrd;
				4'd6 : r6eg<=wrd;
				4'd7 : r7eg<=wrd;
				4'd8 : r8eg<=wrd;
				4'd9 : r9eg<=wrd;
				4'd10 : r10eg<=wrd;
				4'd11 : r11eg<=wrd;
			endcase
		end
		if(ra==wra) begin //bypass
			out <= wrd;			
		end
		else begin
			//out = r12eg[ra];
			case(ra)
				4'd0 : out<=r0eg;
				4'd1 : out<=r1eg;
				4'd2 : out<=r2eg;
				4'd3 : out<=r3eg;
				4'd4 : out<=r4eg;
				4'd5 : out<=r5eg;
				4'd6 : out<=r6eg;
				4'd7 : out<=r7eg;
				4'd8 : out<=r8eg;
				4'd9 : out<=r9eg;
				4'd10 : out<=r10eg;
				4'd11 : out<=r11eg;
			endcase
		end
	end

end
endmodule
