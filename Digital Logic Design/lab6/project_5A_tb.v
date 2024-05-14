`include "project_5A.v"
`timescale 1s/100ms

module project_6_tb;
    reg SRCLK, RCLK, SER, SRCLRbar, OEbar;
    wire [7:0] SH_reg, ST_reg, Q;
    wire QH_P;
    integer i;

   SN74HC595 dut (
    .SRCLK(SRCLK), 
    .RCLK(RCLK), 
    .SER(SER),
    .SRCLRbar(SRCLRbar),
    .OEbar(OEbar),
    .SH_reg(SH_reg),
    .ST_reg(ST_reg),
    .Q(Q),
    .QH_P(QH_P));

    initial begin
        SER <= 0;
        SRCLRbar <= 0;
        OEbar <= 0;
        RCLK <= 0;
        #2;
        SER <= 1;
        SRCLRbar <= 1;
        #2;
        SER <= 0;
        RCLK <= 1;
        #1;
        RCLK <= 0;
        #1;
        RCLK <= 1;
        for(i = 0; i < 7; i = i + 1) begin
            #1 RCLK <= 0;
            #1 RCLK <= 1;
        end
        #1;
        RCLK <= 0;
        OEbar <= 1;
        #1;
        SER <= 1;
        #2;
        SER <= 0;
        RCLK <= 1;
        #1;
        RCLK <= 0;
        OEbar <= 0;
        #4;
        SRCLRbar <= 0;
        #1;
        RCLK <= 1;
        #1;
        RCLK = 0;
        SRCLRbar <= 1;
        #2;
        $finish();
    end
    initial begin
        $dumpfile("project_5A.vcd");
        $dumpvars(1,SRCLK, SER, RCLK, SRCLRbar, OEbar, SH_reg, ST_reg, Q, QH_P);
    end

    always #1 SRCLK = ~SRCLK;
    initial SRCLK = 0;
endmodule
