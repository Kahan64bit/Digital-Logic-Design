// Behav for D-Latch
module d_latch_b(input EN, input D, output reg Q, output reg Qbar);
always @ (EN or D)
    if(EN) begin
        Q <= D;
        Qbar <= ~D;
    end
endmodule

// Behav for D-Flip Flop
module DFFb(input clk, input D, output reg Q);
 always @(posedge clk)
    begin
        Q <= D;
    end
 endmodule