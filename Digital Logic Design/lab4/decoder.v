module SN74HC138(VCC, GND, G1, G2A_bar, G2B_bar, A, B, C, out);
  input VCC, GND, A, B, C, G1, G2A_bar, G2B_bar;
  output [7:0] out;
  reg normal_ops, all_HIGH, all_LOW;
  reg [7:0] out;
  reg [2:0] in;

  always @(in or VCC or GND or A or B or C or G1 or G2A_bar or G2B_bar)
  begin
    normal_ops = VCC && GND && G1 && !G2A_bar && !G2B_bar;
    all_LOW = !VCC || !GND;
    all_HIGH = VCC && GND && (G2A_bar || G2B_bar || !G1);

    in = {C, B, A};
    if (normal_ops)
    begin
      out = 8'b00000000;
      case (in)
        3'b000: out[0] = 1'b1;
        3'b001: out[1] = 1'b1;
        3'b010: out[2] = 1'b1;
        3'b011: out[3] = 1'b1;
        3'b100: out[4] = 1'b1;
        3'b101: out[5] = 1'b1;
        3'b110: out[6] = 1'b1;
        3'b111: out[7] = 1'b1;
        default: out = 8'b11111111;
      endcase
    end

    if (all_HIGH)
      out = 8'b00000000; // b00000000

    if (all_LOW)
      out = 8'b11111111; // b11111111
  end
endmodule
