module Rounder (PhaseIn,Phasel,Phaser);
input [15:0] PhaseIn;
output [8:0] Phaser;
output [6:0] Phasel;

assign Phaser = (PhaseIn[8:0]) & ((1 << 9)-1);
assign Phasel = PhaseIn[15:9];

//assign Phasel = (PhaseIn[8]) ? PhaseIn[15:9]+1 : PhaseIn[15:9];

endmodule

