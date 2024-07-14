`timescale 1ns / 1ps
module write_control (
    input wire wr_clk,
    input wire reset_n,
    input wire f_full,
    output reg [N-1:0] b_wr_ptr,
    output wire MSB_wr_ptr
);
    parameter N = 4;

    always @(posedge wr_clk or negedge reset_n) begin
        if (!reset_n) begin
            b_wr_ptr <= 0;
        end else if (!f_full) begin
            b_wr_ptr <= b_wr_ptr + 1;
        end
    end

    assign MSB_wr_ptr = b_wr_ptr[N-1];
endmodule
