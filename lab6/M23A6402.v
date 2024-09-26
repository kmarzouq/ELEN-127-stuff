module M23A640(csb, so, holdb, sck, si);

input csb,holdb,sck,si;
output so;
wire SOu;
wire SIu;
reg [15:0]addr=16'b0;
wire [0:7]data;
reg [0:7]buff=8'b0;
reg re=1'b0;
reg we=1'b0;
reg [10:0]cntr=11'd31,crt=11'd0;
reg [2:0]state=2'b0;
reg [7:0]instr=8'b0;
wire RST;

SRAM Sgoat(addr[15:3],re,we,data[0:7]);
SPI TF2(csb,sck,SIu,SOu,RST);

always @(negedge sck)begin
		if(cntr==11'd31)cntr<=11'b0;
		else cntr<=cntr+1;
		//cntr<=(cntr+1)%32;
	end
always @(negedge sck)begin
		//if(cntr==10'd31)cntr<=10'b0;
		//else cntr<=cntr+1;
		if(cntr==11'd31 || cntr==11'd0 || csb==1'b1) crt<=0;
		if (state==3'b110)crt<=(crt+1);
	end

always @(posedge csb)begin
		if( cntr==11'd0 || csb==1'b1) begin
			
			state<=3'b0;
			re<=1'b0;
			we<=1'b0;
			instr=8'd0;
			buff<=8'b0;
			addr<=16'b0;
			//SIu<=0;
			end
	end

always @(posedge sck)begin
		
		if(state==3'b001 && cntr==11'd23)begin//write data
			state<=3'b101;
			re<=1'b0;
			end
		else if(state==3'b010 && cntr==11'd23)begin//read data
			state<=3'b110;
			re<=1;
			end

	if (state==3'b0) instr[cntr]<=SOu;
	else if (state==3'b101) buff[cntr-24]<=SOu;
	if (state==3'b001 || state==3'b010) addr[cntr-8]=SOu;
	/*if (state==3'b110 && cntr>22) SIu<=data[cntr-23];
	else SIu<=si;*/
end

always @ (negedge sck)begin
		if(instr==8'b01000000 && cntr==11'd7)begin//write addr
			state<=3'b001;
			end
		else if(instr==8'b11000000 && cntr==11'd7)begin//read addr
			state<=3'b010;
			end
		if (state==3'b101 && cntr==31)begin
			 we<=1;
			end

end




//always @(posedge sck)begin
	
		
//end

//assign instr[cntr] = (state=3'b0) ? SOu;
assign data = (re==1'b0) ? buff : 8'bzzzzzzzz;
assign SIu = (re==1'b1) ? data[crt] : si;
assign so = (re==1'b1 && ~(addr[2] || addr[1]) ) ? SOu : 1'bz; 
assign RST = csb==1;
//assign we = (state==3'b101 && cntr==1'b0 && ~csb);
endmodule
