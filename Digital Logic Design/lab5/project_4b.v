
 module d_latch_s(input EN, input D, output Q, output Qbar);

 wire N1, A1, A2;

 not(N1,D);
 and(A1, D, EN);
 and(A2, N1, EN);
 nor(Qbar, A1, Q);
 nor(Q, A2, Qbar);
 endmodule

 module DFFs(input clk, input D, output QFF);

 wire Q1; // Output of first Latch
 wire Q1bar;
 wire QFF;
 wire QFFbar;
 wire D_latch_w1;
 wire clk;

 assign notclk = !clk;

 d_latch_s Latch1(notclk, D, D_latch_w1, Q1bar);
 d_latch_s Latch2(clk, D_latch_w1, QFF, QFFbar);
 endmodule

 module DFFb(input clk, input D, output reg Q);

 always @(posedge clk)
 begin
 Q <= D;
 end
 endmodule