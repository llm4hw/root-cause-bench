module tb_fixed_comparator;
    reg [3:0] a, b;
    wire result;

    // Instantiate the module
    faulty_comparator uut (
        .a(a),
        .b(b),
        .result(result)
    );

    initial begin
        $display("Testbench started.");

        // Test case 1: a == b
        a = 4'd9; b = 4'd9;
        #10;
        if (result !== 1) $fatal("ERROR: Expected result = 1 when a = b");

        // Test case 2: a != b
        a = 4'd7; b = 4'd2;
        #10;
        if (result !== 0) $fatal("ERROR: Expected result = 0 when a != b");

        // Test case 3: a == b at max value
        a = 4'd15; b = 4'd15;
        #10;
        if (result !== 1) $fatal("ERROR: Expected result = 1 when a = b = 15");

        $display("All test cases passed.");
        $finish;
    end
endmodule
