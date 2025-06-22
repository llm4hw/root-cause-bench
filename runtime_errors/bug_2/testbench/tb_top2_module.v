module tb_top_module;
    reg a, b;
    wire q;

    // Instantiate the module
    top_module uut (
        .a(a), 
        .b(b), 
        .q(q)
    );

    initial begin
        $display("Testbench started.");

        // Test Case 1: Both controllers off -> Light should be off
        a = 0; b = 0;
        #10;
        if (q !== 0) begin
            $display("ERROR: Test Case 1 failed. q = %b (Expected: 0)", q);
            $fatal;
        end

        // Test Case 2: Controller A on, B off -> Light should be off
        a = 1; b = 0;
        #10;
        if (q !== 0) begin
            $display("ERROR: Test Case 2 failed. q = %b (Expected: 0)", q);
            $fatal;
        end

        // Test Case 3: Controller A off, B on -> Light should be off
        a = 0; b = 1;
        #10;
        if (q !== 0) begin
            $display("ERROR: Test Case 3 failed. q = %b (Expected: 0)", q);
            $fatal;
        end

        // Test Case 4: Both controllers on -> Light should be on
        a = 1; b = 1;
        #10;
        if (q !== 1) begin
            $display("ERROR: Test Case 4 failed. q = %b (Expected: 1)", q);
            $fatal;
        end

        $display("All test cases passed.");
        $finish;
    end
endmodule
