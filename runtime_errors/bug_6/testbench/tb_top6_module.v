module tb_top_module;
    reg clk;
    reg pedControl;
    reg longTimeHold;
    reg resetn;
    wire [2:0] outResult;

    // Instantiate the module
    top_module uut (
        .clk(clk),
        .pedControl(pedControl),
        .longTimeHold(longTimeHold),
        .resetn(resetn),
        .outResult(outResult)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        $display("Testbench started.");

        // Initialize signals
        clk = 0;
        pedControl = 0;
        longTimeHold = 0;
        resetn = 0;

        // Reset
        #10 resetn = 1;

        // Test Case 1: Red state after reset
        if (outResult !== 3'b100) begin
            $display("ERROR: Test Case 1 failed. outResult = %b (Expected: 100)", outResult);
            $fatal;
        end

        // Test Case 2: Pedestrian signal triggered without longTimeHold
        pedControl = 1;
        #10;
        if (outResult !== 3'b110) begin
            $display("ERROR: Test Case 2 failed. outResult = %b (Expected: 101)", outResult);
            $fatal;
        end

        //  Test Case 3: Green
        #10;
        if (outResult !== 3'b010) begin
            $display("ERROR: Test Case 3 failed. outResult = %b (Expected: 010)", outResult);
            $fatal;
        end


        // Test Case 4: Yellow
        #10;
        if (outResult !== 3'b001) begin
            $display("ERROR: Test Case 4 failed. outResult = %b (Expected: 001)", outResult);
            $fatal;
        end

        // Test Case 5: Red
        #10;
        if (outResult !== 3'b100) begin
            $display("ERROR: Test Case 5 failed. outResult = %b (Expected: 100)", outResult);
            $fatal;
        end

        // Test Case 6: Pedestrian signal triggered with longTimeHold
        longTimeHold = 1;
        #10;
        if (outResult <= 3'b110) begin
            $display("ERROR: Test Case 6 failed. outResult = %b (Expected > 110)", outResult);
            $fatal;
        end

        $display("All test cases passed.");
        $finish;
    end
endmodule
