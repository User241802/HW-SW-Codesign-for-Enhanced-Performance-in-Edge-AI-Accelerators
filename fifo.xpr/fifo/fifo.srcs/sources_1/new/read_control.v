`timescale 1ns / 1ps
module read_control (
    input wire rd_clk,
    input wire reset_n,
    input wire f_empty,
    output reg [N-1:0] b_rd_ptr,
    output wire MSB_rd_ptr
);
    parameter N = 4;

    always @(posedge rd_clk or negedge reset_n) begin
        if (!reset_n) begin
            b_rd_ptr <= 0;
        end else if (!f_empty) begin
            b_rd_ptr <= b_rd_ptr + 1;
        end
    end

    assign MSB_rd_ptr = b_rd_ptr[N-1];
endmodule
