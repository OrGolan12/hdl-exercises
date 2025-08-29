module pos_edge_detection(
    input clk,
    input in,
    input rst_n,
    output out
);
    logic in_delayed;

    always_ff@(posedge clk or negedge rst_n) begin
        if(!rst_n) in_delayed <= 0;
        else in_delayed <= in;
    end


    assign out = ~in_delayed & in;
endmodule
