module M23A640(csb, so, holdb, sck, si,addr,buff,re,we,cntr,state,instr,val,data,SR1);

input csb,holdb,sck,si;
output so;
wire SOu,SIu;
output reg [0:15]addr=16'b0;
output [7:0]data;
output reg [0:7]buff=8'b0;
output reg re=1'b0,we=1'b0;
output reg [10:0]cntr=11'd30;
output reg [2:0]state=2'b0;
output reg [7:0]instr=8'b0;
output val;
output [7:0]SR1; 

SRAM Sgoat(addr[0:12],re,we,data[7:0],SR1);
SPI TF2(csb,sck,SIu,SOu,val);

always @(negedge sck)begin
		if(cntr==10'd31)cntr<=10'b0;
		else cntr<=cntr+1;
	end

always @(negedge sck)begin
		if(instr==8'b11000000 && cntr==11'd7)begin//read addr
			state<=3'b010;
			end
		else if(instr==8'b01000000 && cntr==11'd7)begin//write addr
			state<=3'b001;
			end
		else if(state==3'b010 && cntr==11'd23)begin//read data
			state<=3'b110;
			re<=1'b1;
			we<=1'b0;
			buff<=data;
			end

		else if(state==3'b001 && cntr==11'd23)begin//write data
			state<=3'b101;
			re<=1'b0;
			we<=1'b0;
			end

		else if(cntr==11'd31) begin
			if(state==3'b101 && cntr==11'd31) we<=1;
			state<=3'b0;
			re<=1'b0;
			instr=8'd0;
			buff<=8'b0;
			addr<=16'b0;
			end
		else we<=0;
	end
always @(sck)begin
	if (state==3'b0) instr[cntr]<=SOu;
	else if (state==3'b001 || state==3'b010) addr[cntr-8]<=SOu;
	else if (state==3'b101) buff[cntr-24]<=SOu;
	//else if (state==3'b110) SIu<=buff[cntr-24];
		
end

assign data = (re==1'b0) ? buff : 8'bzzzzzzzz;
assign SIu = (re==1'b1) ? data[cntr-23] : si;
assign so = (re==1'b1) ? SOu : 1'bz; 

endmodule
