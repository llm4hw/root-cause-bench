module shift_register (
    input clk,             // Clock input
    input reset,           // Asynchronous reset
    input shift_en,        // Shift enable signal
    input serial_in,       // Serial input
    output reg [3:0] data  // 4-bit parallel output
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            data <= 4'b0000; // Clear the register on reset
        end else if (shift_en) begin
            data[0] = serial_in;
            data[1] = data[0];
            data[2] = data[1];
            data[3] = data[2];
        end
    end

endmodule