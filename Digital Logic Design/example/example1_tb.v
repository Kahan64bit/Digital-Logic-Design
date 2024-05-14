`timescale 1ms/100us
module example1_tb;

reg A, B, C;
wire F;

ex1_s dut(A, B, C, F);

initial begin
    #1; C <= 1;
    #1; B <= 1; C <= 0;
    #2; A <= 1;
    #1;
    $finish();
end

initial begin
    A <= 0; B <= 0; C <= 0;
end

initial begin
    $dumpfile("example.vcd");
    $dumpvars(1, A, B, C, F);
end
endmodule