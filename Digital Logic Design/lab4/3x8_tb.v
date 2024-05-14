`include "3x8.v"
module SN74HC138_tb;
 wire [7:0] out;
 reg VCC, GND, A, B, C, G1, G2A_bar, G2B_bar;
 reg [2:0] in;
 integer i;

 SN74HC138 dut(VCC, GND, G1, G2A_bar, G2B_bar, A, B, C, out);

 initial begin
 VCC = 1;
 GND = 1;
 G1 = 1;
 G2A_bar = 0;
 G2B_bar = 0;
 $monitor( "VCC=%b, GND=%b, A=%b, B=%b, C=%b, G1 = %b, G2A_bar = %b, G2B_bar = %b, out=%b", VCC, GND, A, B, C, G1, G2A_bar, G2B_bar,out);
 for (i=0; i<8; i=i+1)
 begin
 {C,B,A} = i;
 #1;
 end
 for (i=6; i>=0; i=i-1)
 begin
 {C,B,A} = i;
 #1;
 end
 $finish();
 end

 initial begin
 $dumpfile("verilog_lab_3A.vcd");
 $dumpvars(1,VCC, GND, G1, G2A_bar, G2B_bar, A, B, C, out);
 end
 endmodule