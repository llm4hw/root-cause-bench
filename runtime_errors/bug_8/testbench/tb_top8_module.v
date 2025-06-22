module tb_top_module;
    reg clk, pedControl, resetn;
    wire [1:0] outResult;

    // Instantiate the module
    top_module uut (
        .clk(clk),
        .pedControl(pedControl),
        .resetn(resetn),
        .outResult(outResult)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        $display("Testbench started.");
        clk = 0;
        pedControl = 0;
        resetn = 0;

        #5;
        resetn = 1;

        // Normal transition: Red -> Green -> Yellow -> Red
        #10;
        if (outResult !== 2'b00) begin
            $display("1 - ERROR: Expected Red (00), but got %b", outResult);
            $fatal;
        end

        #10;
        if (outResult !== 2'b01) begin
            $display("2 - ERROR: Expected Green (01), but got %b", outResult);
            $fatal;
        end

        #10;
        if (outResult !== 2'b10) begin
            $display("3 - ERROR: Expected Yellow (10), but got %b", outResult);
            $fatal;
        end

        #10;
        if (outResult !== 2'b00) begin
            $display("4 - ERROR: Expected Red (00), but got %b", outResult);
            $fatal;
        end

        // Activate PedControl -- Red -> Ped -> Green
        pedControl = 1;
        #10;
        if (outResult !== 2'b11) begin
            $display("pedControl 1 - ERROR: Expected Ped (11), but got %b", outResult);
            $fatal;
        end

        #10;
        if (outResult !== 2'b01) begin
            $display("pedControl 2 - ERROR: Expected Green (01), but got %b", outResult);
            $fatal;
        end
        
        $display("All test cases passed.");
        $finish;
    end
endmodule
