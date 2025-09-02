module counter_tb;
    localparam CLK_PERIOD = 10;
    localparam COUNT = 6;
    // Signals
    logic clk;
    logic rst_n;
    logic in;
    logic [$clog2(COUNT)-1:0] out;

    counter #(.COUNT(COUNT)) u_dut (
      .clk    (clk),
      .rst_n  (rst_n),
      .in(in),
      .out(out)
    );

    //clk
    initial clk = 0;
    always #(CLK_PERIOD) clk = ~clk;

    // Reset task
    task reset_dut();
        begin
            #(CLK_PERIOD);
            rst_n = 0;
            #(2*CLK_PERIOD);
            rst_n = 1;
            #(2*CLK_PERIOD);
        end
    endtask

    task pulse();
        begin
            #3;
            in = 1;
            @(posedge clk);
            #3;
            in = 0;
            @(posedge clk);
        end
    endtask

    initial begin
        reset_dut();
        pulse();
        pulse();
        pulse();
        pulse();
        pulse();
        pulse();
        pulse();
        $finish();

    end


    // ---- VCD dump ----
    initial begin
        $dumpfile("counter_tb.vcd");
        $dumpvars(0, counter_tb);
    end

endmodule
