module tb_top_module;
    reg p1a, p1b, p1c, p1d, p1e, p1f;
    reg p2a, p2b, p2c, p2d;
    wire p1y, p2y;

    top_module uut (
        .p1a(p1a), .p1b(p1b), .p1c(p1c), 
        .p1d(p1d), .p1e(p1e), .p1f(p1f), 
        .p1y(p1y), 
        .p2a(p2a), .p2b(p2b), .p2c(p2c), .p2d(p2d), 
        .p2y(p2y)
    );

    initial begin
        $display("Testbench started.");

        // Test Case 1: All p1a, p1b, p1c are 1 => p1y should be 1
        {p1a, p1b, p1c, p1d, p1e, p1f} = 6'b111000;
        #10;
        if (p1y !== 1) begin
            $display("ERROR: Test Case 1 failed. p1y = %b (Expected: 1)", p1y);
            $fatal;
        end

        // Test Case 2: All p1d, p1e, p1f are 1 => p1y should be 1
        {p1a, p1b, p1c, p1d, p1e, p1f} = 6'b000111;
        #10;
        if (p1y !== 1) begin
            $display("ERROR: Test Case 2 failed. p1y = %b (Expected: 1)", p1y);
            $fatal;
        end

        // Test Case 3: Mix of 0s and 1s => p1y should be 0
        {p1a, p1b, p1c, p1d, p1e, p1f} = 6'b101101;
        #10;
        if (p1y !== 0) begin
            $display("ERROR: Test Case 3 failed. p1y = %b (Expected: 0)", p1y);
            $fatal;
        end

        $display("All test cases passed.");
        $finish;
    end
endmodule
