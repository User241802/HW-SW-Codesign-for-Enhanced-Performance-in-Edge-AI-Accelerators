`timescale 1ns / 1ps
module FIFO (
    input wire wr_clk,
    input wire rd_clk,
    input wire reset_n,
    input wire [D-1:0] wr_data_in,
    output wire [D-1:0] rd_data_out,
    input wire wr_en_in,
    input wire rd_en_in,
    output wire f_full,
    output wire f_empty
);
    parameter N = 4;
    parameter D = 8;

    wire [N-1:0] b_wr_ptr, b_rd_ptr;
    wire MSB_wr_ptr, MSB_rd_ptr;

    write_control #(N) write_ctrl (
        .wr_clk(wr_clk),
        .reset_n(reset_n),
        .f_full(f_full),
        .b_wr_ptr(b_wr_ptr),
        .MSB_wr_ptr(MSB_wr_ptr)
    );

    read_control #(N) read_ctrl (
        .rd_clk(rd_clk),
        .reset_n(reset_n),
        .f_empty(f_empty),
        .b_rd_ptr(b_rd_ptr),
        .MSB_rd_ptr(MSB_rd_ptr)
    );

    DualPortSRAM #(N, D) sram (
        .wr_clk(wr_clk),
        .rd_clk(rd_clk),
        .b_wr_ptr(b_wr_ptr),
        .b_rd_ptr(b_rd_ptr),
        .wr_data_in(wr_data_in),
        .rd_data_out(rd_data_out),
        .wr_en_in(wr_en_in),
        .rd_en_in(rd_en_in)
    );

    FlagLogic #(N) flag_logic (
        .b_wr_ptr(b_wr_ptr),
        .b_rd_ptr(b_rd_ptr),
        .MSB_wr_ptr(MSB_wr_ptr),
        .MSB_rd_ptr(MSB_rd_ptr),
        .f_full(f_full),
        .f_empty(f_empty)
    );

    Synchronizer #(N) synchronizer (
        .wr_clk(wr_clk),
        .rd_clk(rd_clk),
        .b_wr_ptr(b_wr_ptr),
        .b_rd_ptr(b_rd_ptr),
        .sync_wr_ptr(),
        .sync_rd_ptr()
    );
endmodule

