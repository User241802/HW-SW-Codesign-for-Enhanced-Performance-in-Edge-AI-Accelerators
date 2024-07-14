module FIFO_tb;
    reg wr_clk;
    reg rd_clk;
    reg reset_n;
    reg [7:0] wr_data_in;
    wire [7:0] rd_data_out;
    reg wr_en_in;
    reg rd_en_in;
    wire f_full;
    wire f_empty;

    FIFO #(4, 8) fifo (
        .wr_clk(wr_clk),
        .rd_clk(rd_clk),
        .reset_n(reset_n),
        .wr_data_in(wr_data_in),
        .rd_data_out(rd_data_out),
        .wr_en_in(wr_en_in),
        .rd_en_in(rd_en_in),
        .f_full(f_full),
        .f_empty(f_empty)
    );

    initial begin
        // Initialize clocks
        wr_clk = 0;
        rd_clk = 0;
        reset_n = 0;
        wr_en_in = 0;
        rd_en_in = 0;
        wr_data_in = 8'h00;
        
        // Reset the FIFO
        #10 reset_n = 1;
        
        // Write to FIFO
        #10 wr_en_in = 1; wr_data_in = 8'hAA;
        #20 wr_en_in = 1; wr_data_in = 8'hBB;
        #20 wr_en_in = 1; wr_data_in = 8'hCC;
        #20 wr_en_in = 0;
        
        // Read from FIFO
        #20 rd_en_in = 1;
        #40 rd_en_in = 0;
        
        // Finish simulation
        #100 $finish;
    end

    always #5 wr_clk = ~wr_clk;
    always #10 rd_clk = ~rd_clk;

    initial begin
        $dumpfile("fifo_tb.vcd");
        $dumpvars(0, FIFO_tb);
    end
endmodule
