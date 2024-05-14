//All gates using Structural modeling
 module all_gates_s(input a, input b, output not_out, output and_out);
    not(not_out,a);
    and(and_out,a,b);
 endmodule