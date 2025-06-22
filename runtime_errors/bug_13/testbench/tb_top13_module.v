module tb_full_add_4bit;
    reg  [3:0] a, b;
    reg        cin;
    wire [3:0] sum;
    wire       cout;

    full_add_4bit uut (
        .i_a(a),
        .i_b(b),
        .i_cin(cin),
        .o_sum(sum),
        .o_carry(cout)
    );

    task check(input [3:0] a_t, input [3:0] b_t, input cin_t);
        reg [4:0] expected;
        begin
            a = a_t; b = b_t; cin = cin_t;
            #10;
            expected = a_t + b_t + cin_t;
            if ({cout, sum} !== expected)
                $fatal("ERROR: a=%d, b=%d, cin=%b ----- Expected %b, got %b", a, b, cin, expected, {cout, sum});
        end
    endtask

    initial begin
        $display("Testbench started.");
        check(4'd3, 4'd5, 1'b0);  // 3+5=8
        check(4'd7, 4'd8, 1'b0);  // 7+8=15
        check(4'd9, 4'd6, 1'b0);  // 9+6=15
        check(4'd15, 4'd1, 1'b0); // 15+1=16 → carry = 1
        check(4'd15, 4'd15, 1'b1);// 15+15+1=31 → carry = 1

        $display("All test cases passed.");
        $finish;
    end
endmodule
