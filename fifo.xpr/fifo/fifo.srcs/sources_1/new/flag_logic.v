module FlagLogic (
    input wire [N-1:0] b_wr_ptr,
    input wire [N-1:0] b_rd_ptr,
    input wire MSB_wr_ptr,
    input wire MSB_rd_ptr,
    output wire f_full,
    output wire f_empty
);
    parameter N = 4;

    assign f_full = (b_wr_ptr == b_rd_ptr) && (MSB_wr_ptr != MSB_rd_ptr);
    assign f_empty = (b_wr_ptr == b_rd_ptr) && (MSB_wr_ptr == MSB_rd_ptr);
endmodule

