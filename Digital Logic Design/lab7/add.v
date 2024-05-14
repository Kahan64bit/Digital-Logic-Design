module full_adder(A, B, CIN, S, COUT);
 input A;
 input B;
 input CIN;
 output S;
 output COUT;

 wire A, B, CIN, X, Y, S, COUT;

 assign X = A ^ B;
 assign Y = A && B;
 assign S = CIN ^ X;
 assign COUT = Y || (CIN && X);

 endmodule

 module ripple_carry(A, B, SUB, S, OVRF);
  input [3:0] A, B;
  input SUB;
  output [3:0] S;
  output OVRF;
  wire w1, w2, w3;
 
  full_adder adder0(A[0], B[0] ^ SUB, SUB, S[0], w1);
  full_adder adder1(A[1], B[1] ^ SUB, w1, S[1], w2);
  full_adder adder2(A[2], B[2] ^ SUB, w2, S[2], w3);
  full_adder adder3(A[3], B[3] ^ SUB, w3, S[3], OVRF);
 
endmodule



module ripple_carry_adder_tb;
  reg [3:0] A;
  reg [3:0] B;
  reg CIN;
  wire [3:0]S;
  wire COUT;

 ripple_carry_adder dut(A, B, CIN, S, COUT);

 initial begin
 A <= 'b1111;
 B <= 'b0001;
 CIN <= 0;
 #1;
 $display("A = %4b, B = %4b, CIN = %b, S=%4b, COUT = %b", A, B, CIN, S, COUT);
 $finish();
 end

 endmodule


module ripple_carry_sub_tb;
  reg [3:0] A;
  reg [3:0] B;
  reg SUB;
  wire [3:0]S;
  wire OVRF;
 
  ripple_carry_sub dut(A, B, SUB, S, OVRF);
 
 
  initial begin
   	 A <= 'b0000;
   	 B <= 'b0000;
   	 SUB <= 1; // Change to toggle between Add or Sub
   	 #1;
   	 $display("A = %4b, B = %4b, SUB = %b, S=%4b, OVRF = %b", A, B, SUB, S, OVRF);
   	 $finish();  
  end
  
endmodule
