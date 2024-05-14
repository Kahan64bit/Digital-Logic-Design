module SN74HC595 (
    input SRCLK,
    input RCLK,
    input SER,
    input SRCLRbar,
    input OEbar,
    output [7:0] SH_reg,
    output [7:0] ST_reg,
    output [7:0] Q,
    output QH_P);
    
    reg [7:0] SH_reg, ST_reg, Q;
    reg QH_P;
    integer i;

    // Shift Register
    always @(posedge SRCLK) begin

        if(SRCLK) begin
            QH_P <= SH_reg[7];
            SH_reg[7:0] <= {SH_reg[6:0], SER};
        end

        if(!SRCLRbar) begin
        SH_reg[7:0] <= 8'b00000000;
        QH_P <= 0;
        end
    end

    always @(posedge RCLK or OEbar) begin
        ST_reg[7:0] <= SH_reg[7:0];
        if(!OEbar) begin
            Q[7:0] <= SH_reg[7:0];
        end
        else begin
            Q[7:0] <= 8'bzzzzzzzz;
        end
    end
endmodule