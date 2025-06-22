module tb_fsm_mealy_0_to_9;
    reg clk, reset, enableAscii;
    reg [3:0] num_in;
    wire [3:0] state;
    wire [7:0] output_data;
    wire valid;

    fsm_mealy_0_to_9 uut (
        .clk(clk),
        .reset(reset),
        .enableAscii(enableAscii),
        .num_in(num_in),
        .state(state),
        .output_data(output_data),
        .valid(valid)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        $display("Testbench started.");
        clk = 0;
        reset = 1;
        enableAscii = 0;
        num_in = 0;

        #10 reset = 0;

        // Test 1: Valid input
        num_in = 4'd3;
        #10;
        if (state !== 4'd3 || output_data !== 8'd3 || valid !== 1)
            $fatal("Test 1 failed: Expected state=3, output_data=3, valid=1, got %0d %0d %b", state, output_data, valid);

        // Test 2: Valid ASCII
        enableAscii = 1;
        #10;
        if (output_data !== 8'd51) // ASCII for '3'
            $fatal("Test 2 failed: Expected ASCII '3' (51), got %0d", output_data);

        // Test 3: Invalid input
        num_in = 4'd12;
        enableAscii = 0;
        #10;
        if (valid !== 0 || output_data !== 8'd0)
            $fatal("Test 3 failed: Expected output=0 and valid=0 for invalid input");

        $display("All test cases passed.");
        $finish;
    end
endmodule
