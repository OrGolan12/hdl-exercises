module counter #(
    parameter int COUNT = 6 
)(
    // ===== Clock & Reset =====
    input  logic                      clk,
    input  logic                      rst_n,
    // ===== Inputs =====
    input  logic                      in,
    // ===== Outputs =====
    output logic [$clog2(COUNT)-1:0]  out
);

    logic [$clog2(COUNT)-1:0] counter;

    always_ff @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            counter <= '0;

        else if(in) begin
            if (counter == (COUNT - 1))
            counter <= 0;
            else
            counter <= counter + 1;
        end

        else
            counter <= counter;

    end

assign out = counter;

endmodule


