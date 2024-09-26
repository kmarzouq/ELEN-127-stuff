module FIFO(CLK,Din,Push,Pop,RST,Dout,Full,Empty);
input CLK,Push,Pop,RST;
input [7:0]Din;
output [7:0] Dout;
output reg Full,Empty;
reg RSTr,wren;
reg[3:0]head,tail;

r12eg reggy(CLK,RSTr,Din,head,wren,tail,Dout);


always @(RST)begin

	if (RST==1'b1) begin
		RSTr =1'b1;
		wren=1'b0;
		head=4'b0001;
		tail=4'd0;
		Full=4'b0;
		Empty = 1'b1;
	end
	else RSTr=1'b0;
	
	end

always @(posedge CLK) begin
		if (((head+4'b0001 == tail)||((tail==4'b0)&&(head==4'd11)))&& ~Empty) Full = 1'b1;
			if(Push && (~Full || (Push && Pop)))begin
			
				if((head+4'b0001)==4'b1100) head<=4'b0000;
				else head<=head+4'b0001;
				wren=1'b1;
				if (Empty && ~(Push && Pop)) Empty<=1'b0;
			
				
				end
			
			else wren=1'b0;
		
end

always @(posedge CLK) begin
		if (((tail+4'b0001 == head)||((tail==4'd11)&&(head==4'd0)))&& ~Full) Empty = 1'b1;

		if(Pop && (~Empty || (Push && Pop)))begin
			
			if((tail+4'b0001)==4'b1100) tail=4'b0000;
			else tail=tail+4'b0001;
			if (Full && ~(Push && Pop)) Full<=1'b0;

			end
		
		
		end
endmodule
