module modulo_8_gray_counter(
    input clk,
    input rst_n,
    output [2:0] count
);

    typedef enum logic [2:0] {S0,S1,S2,S3,S4,S5,S6,S7} state_t;

    state_t curr, next;

    always_ff @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            curr <= S0;
        else
            curr <= next;
    end

    always_comb begin
        next = curr;
        case(curr)
            S0:
                next = S1;
            S1:
                next = S2;
            S2:
                next = S3;
            S3:
                next = S4;
            S4:
                next = S5;
            S5:
                next = S6;
            S6:
                next = S7;
            S7:
                next = S0;
        endcase
    end

assign count[2] = curr == S4 || curr == S5 || curr == S6 || curr == S7;
assign count[1] = curr == S5 || curr == S4 || curr == S3 || curr == S2;
assign count[0] = curr == S1 || curr == S2 || curr == S5 || curr == S6;

endmodule
