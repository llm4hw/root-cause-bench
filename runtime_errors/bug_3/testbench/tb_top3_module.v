module tb_full_half_add_1bit;
    reg i_a, i_b, i_cin;
    wire o_sum, o_carry;

    // Instantiate the module
    full_half_add_1bit uut (
        .i_a(i_a), 
        .i_b(i_b), 
        .i_cin(i_cin), 
        .o_sum(o_sum), 
        .o_carry(o_carry)
    );

    initial begin
        $display("Testbench started.");

        // Test Case 1: 0 + 0 + 0 => Sum: 0, Carry: 0
        {i_a, i_b, i_cin} = 3'b000;
        #10;
        if (o_sum !== 0 || o_carry !== 0) begin
            $display("ERROR: Test Case 1 failed. o_sum = %b, o_carry = %b (Expected: 0, 0)", o_sum, o_carry);
            $fatal;
        end

        // Test Case 2: 1 + 0 + 0 => Sum: 1, Carry: 0
        {i_a, i_b, i_cin} = 3'b100;
        #10;
        if (o_sum !== 1 || o_carry !== 0) begin
            $display("ERROR: Test Case 2 failed. o_sum = %b, o_carry = %b (Expected: 1, 0)", o_sum, o_carry);
            $fatal;
        end

        // Test Case 3: 1 + 1 + 0 => Sum: 0, Carry: 1
        {i_a, i_b, i_cin} = 3'b110;
        #10;
        if (o_sum !== 0 || o_carry !== 1) begin
            $display("ERROR: Test Case 3 failed. o_sum = %b, o_carry = %b (Expected: 0, 1)", o_sum, o_carry);
            $fatal;
        end

        // Test Case 4: 1 + 1 + 1 => Sum: 1, Carry: 1
        {i_a, i_b, i_cin} = 3'b111;
        #10;
        if (o_sum !== 1 || o_carry !== 1) begin
            $display("ERROR: Test Case 4 failed. o_sum = %b, o_carry = %b (Expected: 1, 1)", o_sum, o_carry);
            $fatal;
        end

        $display("All test cases passed.");
        $finish;
    end
endmodule
