module b8Comp(A,B,LIN,EIN,GIN,L,E,G);
  input [7:0] A;
  input [7:0] B;
  input LIN;
  input EIN;
  input GIN;
  output L;
  output E;
  output G;


  wire L1, E1, G1;

  b4Comp compy1 (A[7:4],B[7:4],LIN,EIN,GIN,L1,E1,G1);
  b4Comp compy2 (A[3:0],B[3:0],L1,E1,G1,L,E,G);

endmodule

