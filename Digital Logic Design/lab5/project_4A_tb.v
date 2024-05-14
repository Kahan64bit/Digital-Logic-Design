`include "lab5/project_4A.v"
`timescale 10ns/1ns
 module project_4A_tb;
 reg EN, D;
 reg delay;
 reg [1:0] delay2;
 wire Q_b, Q_s, Qbar_b, Qbar_s;
 integer i, NUM_TRANSITIONS;

 d_latch_s dls(.EN(EN), .D(D), .Q(Q_s), .Qbar(Qbar_s));
 d_latch_b dlb(.EN(EN), .D(D), .Q(Q_b), .Qbar(Qbar_b));



 initial begin
    NUM_TRANSITIONS = 20;
    $monitor ("[0%t], EN=%0b, D=%0b, Q_s=%0b, Q_b=%0b, Qbar_s=%0b, Qbar_b=%0b",$time, EN, D, Q_s, Q_b, Qbar_s, Qbar_b);   
    // initialize variables
    D <= 0;
    EN <= 0;
    // Delay to start
    #1;
    for (i = 0; i < NUM_TRANSITIONS; i = i + 1) begin
        delay = $random;
        delay2 = $random;
        #(delay2) EN <= ~EN;
        #(delay) D <= i;
    end
    $finish();
 end

 initial begin
    $dumpfile("Project_4A.vcd");
    $dumpvars(1, EN, D, Q_s, Q_b, Qbar_s, Qbar_b);
 end
endmodule