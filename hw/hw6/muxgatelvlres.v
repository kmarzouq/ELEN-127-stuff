/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : Q-2019.12-SP1
// Date      : Mon Dec  4 22:21:10 2023
/////////////////////////////////////////////////////////////


module m32ux ( in, sel, out );
  input [31:0] in;
  input [4:0] sel;
  output out;
  wire   n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75;

  NR2 U41 ( .A(sel[2]), .B(sel[1]), .Z(n63) );
  IVP U42 ( .A(sel[2]), .Z(n41) );
  NR2 U43 ( .A(sel[1]), .B(n41), .Z(n62) );
  AO2 U44 ( .A(n63), .B(in[8]), .C(n62), .D(in[12]), .Z(n43) );
  IVP U45 ( .A(sel[1]), .Z(n40) );
  NR2 U46 ( .A(sel[2]), .B(n40), .Z(n65) );
  NR2 U47 ( .A(n41), .B(n40), .Z(n64) );
  AO2 U48 ( .A(n65), .B(in[10]), .C(n64), .D(in[14]), .Z(n42) );
  ND2 U49 ( .A(n43), .B(n42), .Z(n47) );
  AO2 U50 ( .A(n63), .B(in[0]), .C(n62), .D(in[4]), .Z(n45) );
  AO2 U51 ( .A(n65), .B(in[2]), .C(n64), .D(in[6]), .Z(n44) );
  ND2 U52 ( .A(n45), .B(n44), .Z(n46) );
  IVP U53 ( .A(sel[3]), .Z(n68) );
  AO2 U54 ( .A(sel[3]), .B(n47), .C(n46), .D(n68), .Z(n74) );
  AO2 U55 ( .A(n63), .B(in[9]), .C(n62), .D(in[13]), .Z(n49) );
  AO2 U56 ( .A(n65), .B(in[11]), .C(n64), .D(in[15]), .Z(n48) );
  ND2 U57 ( .A(n49), .B(n48), .Z(n53) );
  AO2 U58 ( .A(n63), .B(in[1]), .C(n62), .D(in[5]), .Z(n51) );
  AO2 U59 ( .A(n65), .B(in[3]), .C(n64), .D(in[7]), .Z(n50) );
  ND2 U60 ( .A(n51), .B(n50), .Z(n52) );
  AO2 U61 ( .A(sel[3]), .B(n53), .C(n52), .D(n68), .Z(n73) );
  AO2 U62 ( .A(n63), .B(in[24]), .C(n62), .D(in[28]), .Z(n55) );
  AO2 U63 ( .A(n65), .B(in[26]), .C(n64), .D(in[30]), .Z(n54) );
  ND2 U64 ( .A(n55), .B(n54), .Z(n59) );
  AO2 U65 ( .A(n63), .B(in[16]), .C(n62), .D(in[20]), .Z(n57) );
  AO2 U66 ( .A(n65), .B(in[18]), .C(n64), .D(in[22]), .Z(n56) );
  ND2 U67 ( .A(n57), .B(n56), .Z(n58) );
  AO2 U68 ( .A(sel[3]), .B(n59), .C(n58), .D(n68), .Z(n72) );
  AO2 U69 ( .A(n63), .B(in[25]), .C(n62), .D(in[29]), .Z(n61) );
  AO2 U70 ( .A(n65), .B(in[27]), .C(n64), .D(in[31]), .Z(n60) );
  ND2 U71 ( .A(n61), .B(n60), .Z(n70) );
  AO2 U72 ( .A(n63), .B(in[17]), .C(n62), .D(in[21]), .Z(n67) );
  AO2 U73 ( .A(n65), .B(in[19]), .C(n64), .D(in[23]), .Z(n66) );
  ND2 U74 ( .A(n67), .B(n66), .Z(n69) );
  AO2 U75 ( .A(sel[3]), .B(n70), .C(n69), .D(n68), .Z(n71) );
  MUX41P U76 ( .D0(n74), .D1(n73), .D2(n72), .D3(n71), .A(sel[0]), .B(sel[4]), 
        .Z(n75) );
  IVP U77 ( .A(n75), .Z(out) );
endmodule

