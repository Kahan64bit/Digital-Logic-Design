`include "lab5/project_4c.v"
`timescale 10ns/1ns

module Project_5b_tb;
reg clk, EN, D;
reg delay;
reg [1:0] delay2;
wire Q_b, Qbar_b, QFFb;
integer i, NUM_TRANSITIONS;
integer seed = 1;

d_latch_b dlb(.EN(EN), .D(D), .Q(Q_b), .Qbar(Qbar_b));
DFFb dffb(.clk(clk), .D(D), .Q(QFFb));

initial begin
    NUM_TRANSITIONS = 20;

    $monitor("[0%t], clk=%0b, EN=%0b, D=%0b, Q_b=%0b, QFFb=%0b, Qbar_b=%0b",$time, clk, EN, D, Q_b, QFFb, Qbar_b);
    D <= 0;
    EN <= 0;
    #1;

    for(i = 0; i < NUM_TRANSITIONS; i = i + 1) begin
        delay = $random(seed);
        delay2 = $random(seed);
        #(delay2) EN <= ~EN; 
        #(delay) D <= i;
    end
    $finish();
end

initial begin
    $dumpfile("project_4c.vcd");
    $dumpvars(1, clk, EN, D, Q_b, Qbar_b, QFFb);
end

always #2 clk = ~clk;
initial clk = 0;
endmodule

        







