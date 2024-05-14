`include "lab5/project_4b.v"
`timescale 10ms/1ms

module Project_5b_tb;

 reg clk, D;
 reg [2:0] delay;
 wire QFFs, QFFb;
 integer i, NUM_TRANSITIONS;
 integer seed = 1;

 //Instantiate DFFs
 DFFs dut1(clk, D, QFFs);
 DFFb dut2(clk, D, QFFb);

 initial begin
 NUM_TRANSITIONS = 20;
 D <= 0;
 for (i = 0; i < NUM_TRANSITIONS; i = i+1) begin
 delay = $random(seed);
 #(delay) D <= i;
 end
 $finish();
 end

 initial begin
 $dumpfile("project_4B_results.vcd");
 $dumpvars(1,clk, D, QFFs, QFFb);
 end

 always #4 clk = ~ clk;
 initial clk = 0;

 endmodule