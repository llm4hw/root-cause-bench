module tb_top_module;
    reg clk, resetn;
    wire [1:0] states;

    // Instantiate the module
    top_module uut (
        .clk(clk),
        .resetn(resetn),
        .states(states)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        $display("Testbench started.");
        clk = 0;
        resetn = 0;
        #10;

        resetn = 1;

        // State sequence: Red -> Ped -> Green -> Yellow -> Red
        #10;
        if (states !== 2'b00) begin
            $display("ERROR: Expected Red (00), but got %b", states);
            $fatal;
        end

        #10;
        if (states !== 2'b11) begin
            $display("ERROR: Expected Ped (11), but got %b", states);
            $fatal;
        end

        #10;
        if (states !== 2'b01) begin
            $display("ERROR: Expected Green (01), but got %b", states);
            $fatal;
        end

        #10;
        if (states !== 2'b10) begin
            $display("ERROR: Expected Yellow (10), but got %b", states);
            $fatal;
        end

        #10;
        if (states !== 2'b00) begin
            $display("ERROR: Expected Red (00), but got %b", states);
            $fatal;
        end

        $display("All test cases passed.");
        $finish;
    end
endmodule
