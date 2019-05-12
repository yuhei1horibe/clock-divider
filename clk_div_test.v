`timescale 1ns/1ps

// Test bench top
module clk_div_test;
    reg       clk_in;
    wire      clk_out;
    reg       reset;
    reg [32:0]div_cnt;

    // Reset
    initial begin
        reset   <= 1'b0;
        div_cnt <= 32'h00000000;
        clk_in  <= 1'b0;
        #100
        reset   <= 1'b1;
        div_cnt <= 32'h00000001;
    end

    // Generate input clock
    always #5 begin
        clk_in <= ~clk_in;
    end

    // Counter increment
    always #500 begin
        div_cnt <= div_cnt + 5;
    end

    // Module instantiation
    clock_divider dut_clk_div(
        .src_clk(clk_in),
        .reset(reset),
        .clock_out(clk_out),
        .clk_div(div_cnt)
    );
endmodule
