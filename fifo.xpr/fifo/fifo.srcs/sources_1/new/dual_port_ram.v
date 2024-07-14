`timescale 1ns / 1ps
module DualPortSRAM (
    input wire wr_clk,
    input wire rd_clk,
    input wire [N-1:0] b_wr_ptr,
    input wire [N-1:0] b_rd_ptr,
    input wire [D-1:0] wr_data_in,
    output wire [D-1:0] rd_data_out,
    input wire wr_en_in,
    input wire rd_en_in
);
    parameter N = 4;
    parameter D = 8;
    
    reg [D-1:0] memory [(2**N)-1:0];
    reg [D-1:0] data_out;

    always @(posedge wr_clk) begin
        if (wr_en_in) begin
            memory[b_wr_ptr] <= wr_data_in;
        end
    end

    always @(posedge rd_clk) begin
        if (rd_en_in) begin
            data_out <= memory[b_rd_ptr];
        end
    end

    assign rd_data_out = data_out;
endmodule

