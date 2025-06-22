module tb_top_module;
    reg [7:0] a, b, c, d;
    wire [7:0] min;

    // Instantiate the module
    top_module uut (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .min(min)
    );

    initial begin
        $display("Testbench started.");

        // Test Case 1: All greater than a -> min should be a
        a = 8'd10; b = 8'd20; c = 8'd30; d = 8'd40;
        #10;
        if (min !== 10) begin
            $display("ERROR: Test Case 1 failed. min = %d (Expected: 10)", min);
            $fatal;
        end

        // Test Case 2: b is the first smaller -> min should be b
        a = 8'd10; b = 8'd5; c = 8'd6; d = 8'd7;
        #10;
        if (min !== 5) begin
            $display("ERROR: Test Case 2 failed. min = %d (Expected: 5)", min);
            $fatal;
        end

        // Test Case 3: b is greater, c is smaller -> min should be c
        a = 8'd10; b = 8'd15; c = 8'd8; d = 8'd7;
        #10;
        if (min !== 8) begin
            $display("ERROR: Test Case 3 failed. min = %d (Expected: 8)", min);
            $fatal;
        end

        // Test Case 4: b, c are greater, d is smaller -> min should be d
        a = 8'd10; b = 8'd15; c = 8'd18; d = 8'd9;
        #10;
        if (min !== 9) begin
            $display("ERROR: Test Case 4 failed. min = %d (Expected: 9)", min);
            $fatal;
        end

        $display("All test cases passed.");
        $finish;
    end
endmodule
