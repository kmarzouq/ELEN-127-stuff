module game (mv,CLK,RST,state,Win,Imp,Lose);
input CLK,RST;//clock and reset
input [0:3] mv; //move
output reg [0:3] state; // current game state farmer, fox,chicken,seeds;
output reg Imp,Win,Lose;

always @(posedge CLK) begin
	if (RST==1'b1)begin
		state = 4'b0000;
		Lose = 1'b0;
		Win = 1'b0;
		Imp = 1'b0;
		end

//	else if ((({1'b0,mv[1]}+{1'b0,mv[2]}+{1'b0,mv[3]})>1)||(mv[0]==1'b0)|Lose|Win) Imp=1'b1;
	else if ((mv==4'b1110)||(mv==4'b1011)||(mv==4'b1101)||(mv==4'b1111)||(mv[0]==1'b0)||Lose||Win) Imp=1'b1;
	else if ((mv[1]&&(state[0]!=state[1]))||(mv[2]&&(state[0]!=state[2]))||(mv[3]&&(state[0]!=state[3]))) Imp=1'b1;
	else if (~Lose && ~Win) begin
		Imp=1'b0;
		case (state)
			4'b0000: if (mv[1]==1'b1) begin 
						state = 4'b1100;
						Lose = 1'b1;
						end
					else if (mv[2]==1'b1) begin 
						state = 4'b1010;
						end
					else if (mv[3]==1'b1) begin 
						state = 4'b1001;
						Lose = 1'b1;
						end
					else begin
						state = 4'b1000;
						Lose = 1'b1;
						end
			4'b1010: if (mv[2]==1'b1) begin 
						state = 4'b0000;
						end
					else begin
						state = 4'b0010;
						end
			4'b0010: if (mv[1]==1'b1) begin 
						state = 4'b1110;
						end
					else if (mv[3]==1'b1) begin 
						state = 4'b1011;
						end
					else begin
						state = 4'b1010;
						end
			4'b1011: if (mv[2]==1'b1) begin 
						state = 4'b0001;
						end
					else if (mv[3]==1'b1) begin 
						state = 4'b0010;
						end
					else begin
						state = 4'b0011;
						Lose = 1'b1;
						end
			4'b0001: if (mv[1]==1'b1) begin 
						state = 4'b1101;
						end
					else if (mv[2]==1'b1) begin 
						state = 4'b1011;
						end
					else begin
						state = 4'b1001;
						Lose = 1'b1;
						end
			4'b1110: if (mv[1]==1'b1) begin 
						state = 4'b0010;
						end
					else if (mv[2]==1'b1) begin 
						state = 4'b0100;
						end
					else begin
						state = 4'b0110;
						Lose = 1'b1;
						end
			4'b0100: if (mv[2]==1'b1) begin 
						state = 4'b1110;
						end
					else if (mv[3]==1'b1) begin 
						state = 4'b1101;
						end
					else begin
						state = 4'b1100;
						Lose = 1'b1;
						end
			4'b1101: if (mv[1]==1'b1) begin 
						state = 4'b0001;
						end
					else if (mv[3]==1'b1) begin 
						state = 4'b0100;
						end
					else begin
						state = 4'b0101;
						end
			4'b0101: if (mv[2]==1'b1) begin 
						state = 4'b1111;
						Win=1'b1;
						end
					else begin
						state = 4'b1101;
						end
			4'b1111: Win=1'b1;
		endcase
			end
	end

	
endmodule
