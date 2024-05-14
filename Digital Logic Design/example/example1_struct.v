module ex1_s (input A, input B, input C, output F);
wire F, W, X;

not(W, A);
and(X, W, B);
or(F, X, C);
    
endmodule