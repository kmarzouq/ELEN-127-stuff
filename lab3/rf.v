module rf (CLK,Ra0,Ra1,Wa,Wd,We,Rd0,Rd1);
	input CLK,We;
	input [7:0] Wd;
	input [2:0] Ra0,Ra1,Wa;
	output reg [7:0] Rd0,Rd1;

	reg[7:0] posw;
	wire [7:0] Out1,Out2,Out3,Out4,Out5,Out6,Out7,Out8;

	r8eg R1(CLK,Wd,posw[0],Out1);
	r8eg R2(CLK,Wd,posw[1],Out2);
	r8eg R3(CLK,Wd,posw[2],Out3);
	r8eg R4(CLK,Wd,posw[3],Out4);
	r8eg R5(CLK,Wd,posw[4],Out5);
	r8eg R6(CLK,Wd,posw[5],Out6);
	r8eg R7(CLK,Wd,posw[6],Out7);
	r8eg R8(CLK,Wd,posw[7],Out8);
//writing
always @(CLK) begin
	if (We) begin
		case(Wa)//3-8 decoder
		3'b000: posw= 8'b00000001;
		3'b001: posw= 8'b00000010;
		3'b010: posw= 8'b00000100;
		3'b011: posw= 8'b00001000;
		3'b100: posw= 8'b00010000;
		3'b101: posw= 8'b00100000;
		3'b110: posw= 8'b01000000;
		3'b111: posw= 8'b10000000;
		endcase
	end
	else begin
		posw = 8'b00000000;
		end

	//bypass
	if (We&(Wa==Ra0))begin
		Rd0=Wd;
	end 

//Rd0

	else begin
		case(Ra0)
		3'b000: Rd0=Out1;
		3'b001: Rd0=Out2;
		3'b010: Rd0=Out3;
		3'b011: Rd0=Out4;
		3'b100: Rd0=Out5;
		3'b101: Rd0=Out6;
		3'b110: Rd0=Out7;
		3'b111: Rd0=Out8;
		endcase
	end

//Rd1
	if (We&(Wa==Ra1))begin
		Rd1=Wd;
	end 

	else begin
		case(Ra1)
		3'b000: Rd1=Out1;
		3'b001: Rd1=Out2;
		3'b010: Rd1=Out3;
		3'b011: Rd1=Out4;
		3'b100: Rd1=Out5;
		3'b101: Rd1=Out6;
		3'b110: Rd1=Out7;
		3'b111: Rd1=Out8;
		endcase
	end
end
endmodule


