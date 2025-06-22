module tb_top_module;
    reg [4:1] x;
    wire f;

    // Instantiate the module
    top_module uut (
        .x(x), 
        .f(f)
    );

    // Expected values for each input (in hexadecimal order)
    reg [15:0] expected_values = 16'b1100111000001011;

    integer i;

    initial begin
        $display("Testbench started.");
        for (i = 0; i < 16; i = i + 1) begin
            x = i[3:0];   // Assign the value to the input
            #10;
            if (f !== expected_values[15 - i]) begin
                $display("ERROR: Test Case %0x failed. f = %b (Expected: %b)", i[3:0], f, expected_values[15 - i]);
                $fatal;
            end
        end

        $display("All test cases passed.");
        $finish;
    end
endmodule
