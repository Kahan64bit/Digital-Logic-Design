`timescale 10ns/1ns
 module project_2A;

  
    reg A=0, B=0, C=0, D = 0;
    wire F;

    assign F = (!A && C) || (A && !D);

    initial begin
        $dumpfile ("project_2B.vcd");
        $dumpvars(1,A,B,C,D,F);
        #16;
        $finish();
    end

    always #8 A = ~A;
    always #4 B = ~B;
    always #2 C = ~C;
    always #1 D = ~D;
 endmodule


 

