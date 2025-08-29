module pos_edge_detection_tb;
    localparam CLK_PERIOD = 10;
    localparam PULSE_AMOUNT = 5;
    // Signals
    logic clk;
    logic rst_n;
    logic in;
    logic out;
    logic [2:0] on_cycles;
    logic [2:0] off_cycles;

    pos_edge_detection u_dut (
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

    initial begin
        clk = 0;
        in = 0;
        rst_n = 1;
        reset_dut();
        for (int i = 0; i < PULSE_AMOUNT; i++) begin
            #1;
            $display("TEST DONE @ %0t", $time);
            on_cycles = $urandom_range(1,5);
            $display("[%0t] ON  = %0d", $time, int'(on_cycles));
            off_cycles = $urandom_range(1,5);
            $display("[%0t] OFF = %0d", $time, int'(off_cycles));
            in = 1;
            repeat (on_cycles)  @(posedge clk);
            in = 0;
            repeat (off_cycles)  @(posedge clk);
        end
        $finish;
    end

    // ---- VCD dump ----
    initial begin
        $dumpfile("edge_detection_tb.vcd");
        $dumpvars(0, pos_edge_detection_tb);
    end
    // ------------------
endmodule
