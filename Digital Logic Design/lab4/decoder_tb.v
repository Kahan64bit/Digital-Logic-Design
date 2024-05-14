`include "decoder.v"
module SN74HC138_tb;
  reg VCC, GND, A, B, C, G1, G2A_bar, G2B_bar;
  wire [15:0] out;
  reg [3:0] in;
  integer i;

  SN74HC138 uut1 (.VCC(VCC), .GND(GND), .G1(~G1), .G2A_bar(G2A_bar), .G2B_bar(G2B_bar), .A(A), .B(B), .C(C), .out(out[7:0]));
  SN74HC138 uut2 (.VCC(VCC), .GND(GND), .G1(G1), .G2A_bar(G2A_bar), .G2B_bar(G2B_bar), .A(A), .B(B), .C(C), .out(out[15:8]));

  initial begin
    VCC = 1;
    GND = 1;
    G1 = 0;
    G2A_bar = 0;
    G2B_bar = 0;

    $monitor("VCC=%b, GND=%b, A=%b, B=%b, C=%b, G1=%b, G2A_bar=%b, G2B_bar=%b, out=%b", VCC, GND, A, B, C, G1, G2A_bar, G2B_bar, out);

 
    for (i = 0; i < 16; i = i + 1) begin
      {G1, C, B, A} = i;
      #1;
    end
    
    
    for (i = 14; i >= 0; i = i - 1) begin
      {G1, C, B, A} = i;
      #1;
    end

    $finish();
  end

  initial begin
    $dumpfile("verilog_lab_3A.vcd");
    $dumpvars(1, VCC, GND, A, B, C, G1, G2A_bar, G2B_bar, out);
  end
endmodule
