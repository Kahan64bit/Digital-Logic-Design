module Sequence_Detector(
    input wire CLK, 
    input wire X, 
    input wire A, 
    input wire B, 
    output A_star, 
    output B_star, 
    output F);
  
  reg A_star, B_star, F;
  
  
  always @(posedge CLK) begin
    A_star = (~X & B) | (X & A & (~B));
    B_star = (X);
    F = A & B;
  end
endmodule

/*
module ABC(
    input wire CLK,
    input wire X,
    input wire A,
    input wire B
)
*/