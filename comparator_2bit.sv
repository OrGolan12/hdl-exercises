module comparator_2bit (
    input [1:0] a,
    input [1:0] b,
    output y
);
    wire n1, n2;

    comparator_1bit u1 (
    .a(a[1]),
    .b(b[1]),
    .y(n1)
    );

    comparator_1bit u2 (
    .a(a[0]),
    .b(b[0]),
    .y(n2)
    );

    wire n3 = ~(a[1] ^ b[1]);
    wire n4 = n3 & n2;
    assign y = n1 | n4;

endmodule