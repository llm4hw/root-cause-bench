module tb_shift_register;
    reg clk, reset, shift_en, serial_in;
    wire [3:0] data;

    // Instantiate the module
    shift_register uut (
        .clk(clk),
        .reset(reset),
        .shift_en(shift_en),
        .serial_in(serial_in),
        .data(data)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        $display("Testbench started.");
        
        clk = 0;
        reset = 1;
        shift_en = 0;
        serial_in = 0;

        #10;
        reset = 0;
        shift_en = 1;

        // input 1010
        serial_in = 1; #10;
        if (data !== 4'b0001) $fatal("ERROR: Expected 0001, got %b", data);

        serial_in = 0; #10;
        if (data !== 4'b0010) $fatal("ERROR: Expected 0010, got %b", data);

        serial_in = 1; #10;
        if (data !== 4'b0101) $fatal("ERROR: Expected 0101, got %b", data);

        serial_in = 1; #10;
        if (data !== 4'b1011) $fatal("ERROR: Expected 1011, got %b", data);

        $display("All test cases passed.");
        $finish;
    end
endmodule
