`timescale 1ns/1ns
module project_6_tb;
    reg SRCLK, RCLK, SER, SRCLRbar, OEbar;
    wire [7:0] SH_reg, ST_reg, Q;
    wire QH_P;
    integer i, j;
  	reg [7:0] hex_values [0:15];

    SN74HC595 dut (
        .SRCLK(SRCLK), 
        .RCLK(RCLK), 
        .SER(SER),
        .SRCLRbar(SRCLRbar),
        .OEbar(OEbar),
        .SH_reg(SH_reg),
        .ST_reg(ST_reg),
        .Q(Q),
        .QH_P(QH_P)
    );
    
    initial begin
      hex_values[0] = 8'b11111100; // 0
      hex_values[1] = 8'b01100000; // 1
      hex_values[2] = 8'b11011010; // 2
      hex_values[3] = 8'b11110010; // 3
      hex_values[4] = 8'b01100110; // 4
      hex_values[5] = 8'b10110110; // 5
      hex_values[6] = 8'b10111110; // 6
      hex_values[7] = 8'b11100000; // 7
      hex_values[8] = 8'b11111110; // 8
      hex_values[9] = 8'b11100110; // 9
      hex_values[10] = 8'b11101110; // A
      hex_values[11] = 8'b00111110; // B
      hex_values[12] = 8'b10011100; // C
      hex_values[13] = 8'b01111010; // D
      hex_values[14] = 8'b10011110; // E
      hex_values[15] = 8'b10001110; // F
    end
    
    initial begin
        
        SRCLK <= 0;
        RCLK <= 0;
        SER <= 0;
        SRCLRbar <= 1;
        OEbar <= 0;
        #5;

        for (j = 0; j < 16; j = j + 1) begin
            for(i = 7; i >= 0; i = i - 1) begin
              SER <= hex_values[j][i];
                #1 SRCLK <= 0; 
                #1 SRCLK <= 1;
            end

            #1 RCLK <= 1; 
            #1 RCLK <= 0;
            #10; // Wait some time before moving on to the next value
        end

        #1;
        OEbar <= 1; 
        #10;
        $finish();
    end

    initial begin
        $dumpfile("project_5B.vcd");
        $dumpvars(1,SRCLK, SER, RCLK, SRCLRbar, OEbar, SH_reg, ST_reg, Q, QH_P);
    end

  always #1 SRCLK = ~SRCLK;
  always #1 SRCLRbar = ~RCLK;
  initial SRCLK = 0;
    
endmodule
