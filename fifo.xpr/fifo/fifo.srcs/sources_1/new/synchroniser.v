module Synchronizer (
    input wire wr_clk,
    input wire rd_clk,
    input wire [N-1:0] b_wr_ptr,
    input wire [N-1:0] b_rd_ptr,
    output reg [N-1:0] sync_wr_ptr,
    output reg [N-1:0] sync_rd_ptr
);
    parameter N = 4;

    always @(posedge rd_clk) begin
        sync_wr_ptr <= b_wr_ptr;
    end

    always @(posedge wr_clk) begin
        sync_rd_ptr <= b_rd_ptr;
    end
endmodule
