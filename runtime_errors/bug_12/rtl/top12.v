module faulty_comparator (
    input [3:0] a, // 4-bit input
    input [3:0] b, // 4-bit input
    output reg result // Result of comparison
);
    always @(*) begin
        if (a == 5'b10101) begin
            result = 1;
        end else begin
            result = 0;
        end
    end
endmodule