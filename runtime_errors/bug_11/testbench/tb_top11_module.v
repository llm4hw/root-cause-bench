module tb_fsm_mealy_0_to_9;
    reg clk, reset, enableAscii;
    reg [3:0] num_in;
    wire [3:0] state;
    wire [7:0] output_data;
    wire valid;

    // Instantiate the module
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
        num_in = 4'b0000;

        #10 reset = 0;

        num_in = 4'd5;
        #10;
        if (output_data !== 8'd5) $fatal("ERROR: Expected 5, got %d", output_data);

        // enableAscii = 1;
        // #10;
        // if (output_data !== 8'd53) $fatal("ERROR: Expected ASCII '5', got %d", output_data);

        num_in = 4'd10;
        #10;
        if (valid !== 0) $fatal("ERROR: Invalid input should not be valid.");
        if (output_data !== 8'd0) $fatal("ERROR: Expected 0 for invalid input, got %d", output_data);

        num_in = 4'd15;
        #10;
        if (valid !== 0) $fatal("ERROR: Invalid input should not be valid.");
        if (output_data !== 8'd0) $fatal("ERROR: Expected 0 for invalid input, got %d", output_data);

        $display("All test cases passed.");
        $finish;
    end
endmodule
