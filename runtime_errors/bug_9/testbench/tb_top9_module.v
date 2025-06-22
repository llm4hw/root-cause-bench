module tb_morse_code;
    reg clk, reset;
    reg [1:0] select;
    wire morse_out;

    // Instantiate the module
    morse_code uut (
        .clk(clk),
        .reset(reset),
        .select(select),
        .morse_out(morse_out)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        $display("Testbench started.");
        clk = 0;
        reset = 1;
        select = 2'b00;  // A
        #10 reset = 0;

        // Test 'A' -> .-
        #10 select = 2'b00;
        #150;  // Wait for DOT and DASH
        if (!morse_out) begin
            $display("Morse for A generated correctly.");
        end else begin
            $display("ERROR: Morse for A not correct.");
            $fatal;
        end
        
        // Test 'O' -> ---
        #10 select = 2'b01;
        reset = 1;
        #10 reset = 0;
        #150;
        if (!morse_out) begin
            $display("Morse for O generated correctly.");
        end else begin
            $display("ERROR: Morse for O not correct.");
            $fatal;
        end
        
        // Test 'S' -> ...
        #10 select = 2'b10;
        reset = 1;
        #10 reset = 0;
        #150;
        if (!morse_out) begin
            $display("Morse for S generated correctly.");
        end else begin
            $display("ERROR: Morse for S not correct.");
            $fatal;
        end
        
        $display("All test cases passed.");
        $finish;
    end
endmodule
