// Structural model of D-Latch
 module d_latch_s(input EN, input D, output Q, output Qbar);
// intermediary wires
wire N1, A1, A2;

// intermediary gates
not(N1, D);
and(A1, D, EN);
and(A2, N1, EN);
nor(Qbar, A1, Q);
nor(Q, A2, Qbar);

endmodule

// Behavioral model of D-Latch

module d_latch_b(input EN, input D, output reg Q, output reg Qbar);
always @ (EN or D)
    if(EN) begin
        Q <= D;
        Qbar <= ~D;
    end
endmodule

