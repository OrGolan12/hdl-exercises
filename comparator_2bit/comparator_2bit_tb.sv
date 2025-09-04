module comparator_2bit_tb;
    logic [1:0] a, b;
    logic y;

    comparator_2bit u_dut(
        .a(a),
        .b(b),
        .y(y)
    );

    // === Golden Reference ===
    function automatic bit golden_comp(input logic [1:0] a, logic [1:0] b);
        return a > b;
    endfunction

    //

    int tests = 0;

    // === Stimulus ===
    initial begin
        for(int i = 0; i <= 3; i++) begin
            for(int j = 0; j <= 3; j++) begin
                #1;
                a = i;
                b = j;
                #0;
                assert (y == golden_comp(a,b))
                    else $error("a=%d, b=%d, expected y:%d, y:%d", a, b, golden_comp(a,b), y);
                tests++;
            end
        end
        #1;
    $display("number of tests:%0d", tests);
    $finish();
    end

    // === Waveform dump ===
    initial begin
    $dumpfile("comparator_2bit_tb.vcd");
    $dumpvars(0, comparator_2bit_tb);
  end






endmodule
