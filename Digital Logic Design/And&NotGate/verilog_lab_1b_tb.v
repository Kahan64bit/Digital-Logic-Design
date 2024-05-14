`timescale 10ns/1ns
 module all_gates_tb;

 reg A, B;
 wire OUT_NOT, OUT_AND;

 all_gates_s uut(A, B, OUT_NOT, OUT_AND);

 initial begin
 A = 0; B = 0;
 #1
 A = 0; B = 1;
 #1
 A = 1; B = 0;
 #1
 A = 1; B = 1;
 #1
 $finish();
 end

 initial begin
 $dumpfile("verilog_lab_1b.vcd");
 $dumpvars(1,A,B,OUT_NOT, OUT_AND);
 end
endmodule