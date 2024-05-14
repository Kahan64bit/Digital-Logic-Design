`timescale 10ns/1ns

 module not_gate_tb;

 reg A;
 wire Y;

 not_gate_s uut(A,Y);

 initial begin
 A = 0;
 #1
 A = 1;
 #1
 $finish();
 end

 initial begin
 $dumpfile("verilog_1a_simulation.vcd");
 $dumpvars(1,A,Y);
 end

 endmodule