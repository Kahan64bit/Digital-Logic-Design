`include "fsm.v"
`timescale 1ns/1ns

module Sequence_Detector_tb;
  reg[0:27] vector ='b0010101010010101100110101000;  
  reg X, A, B, CLK;  
  wire A_star, B_star, F;
  integer i;
  
  Sequence_Detector uut(CLK, X, A, B, A_star, B_star, F);
  
  initial begin
    #1;
    X = vector[0];
    A = 0;
    B = 0;
    #2;
    
    for (i=1; i<27; i = i +1) begin
      X = vector[i];
      A = A_star;
      B = B_star;
      #2;
    end
    #2
    $finish();
  end
  
  initial begin
    $dumpfile("FSM.vcd");
    $dumpvars(1,F,A,B,X,A_star,B_star,CLK);
  end
  
  always #1 CLK = ~CLK;
  initial CLK = 0;
endmodule