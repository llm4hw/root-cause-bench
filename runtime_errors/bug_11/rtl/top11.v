module fsm_mealy_0_to_9 (
    input clk,
    input reset,
    input enableAscii, // Enable ASCII output - change on outptu_data
    input [3:0] num_in, // 4-bit input for numbers '0' to '9'
    output reg [3:0] state, // State output, one state for each number
    output reg [7:0] output_data, // Output datapath (e.g., ASCII value or transformed data)
    output reg valid // Valid signal if the input is in the range '0' to '9'
);
    // State encoding
    localparam [3:0]
        S0 = 4'd0, S1 = 4'd1, S2 = 4'd2, S3 = 4'd3, S4 = 4'd4,
        S5 = 4'd5, S6 = 4'd6, S7 = 4'd7, S8 = 4'd8, S9 = 4'd9;

    // FSM sequential logic
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= S0; // Default state on reset
            output_data <= 8'd0; // Default output
            valid <= 0; // Default invalid
        end else begin
            state <= num_in;
            valid <= 1;
        end
    end

    always @(state) begin
        if(enableAscii) begin
            case (state)
                S0: output_data <= 8'd48; // ASCII '0'
                S1: output_data <= 8'd49; // ASCII '1'
                S2: output_data <= 8'd50; // ASCII '2'
                S3: output_data <= 8'd51; // ASCII '3'
                S4: output_data <= 8'd52; // ASCII '4'
                S5: output_data <= 8'd53; // ASCII '5'
                S6: output_data <= 8'd54; // ASCII '6'
                S7: output_data <= 8'd55; // ASCII '7'
                S8: output_data <= 8'd56; // ASCII '8'
                S9: output_data <= 8'd57; // ASCII '9'
            endcase
        end
        else begin
            case(state)
                S0: output_data <= 8'd0;
                S1: output_data <= 8'd1;
                S2: output_data <= 8'd2;
                S3: output_data <= 8'd3;
                S4: output_data <= 8'd4;
                S5: output_data <= 8'd5;
                S6: output_data <= 8'd6;
                S7: output_data <= 8'd7;
                S8: output_data <= 8'd8;
                S9: output_data <= 8'd9;
            endcase
        end
    end
endmodule