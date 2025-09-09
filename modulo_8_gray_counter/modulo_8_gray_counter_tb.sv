`timescale 1ns/1ps
module modulo_8_gray_counter_tb;
    localparam CLK_PERIOD = 10;
    logic clk;
    logic rst_n;
    logic [2:0] count;

    modulo_8_gray_counter dut(.clk(clk), .rst_n(rst_n), .count(count));
    initial clk = 0;
    always #(CLK_PERIOD/2) clk = ~clk;

    initial begin
        $timeformat(-9,2," ns",10);
        $dumpfile("modulo_8_gray_counter_tb.vcd");
        $dumpvars(0, modulo_8_gray_counter_tb);
        $monitor("[%3t] count=%3b", $time,count);
    end

    task reset_dut(); begin
        rst_n = 0;
        @(negedge clk); rst_n = 1;
        @(posedge clk);
    end endtask

    initial begin
        reset_dut();
        repeat (10) @(posedge clk);
        $finish;
    end
endmodule
