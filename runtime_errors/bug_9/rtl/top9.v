module morse_code (
    input wire clk,
    input wire reset,
    input wire [1:0] select,
    output reg morse_out
);

    parameter DOT = 10;
    parameter DASH = 30;
    parameter SPACE = 10;

    reg [7:0] counter;
    reg [3:0] state;

    localparam IDLE = 0,
               A_DOT = 1,
               A_DASH = 2,
               O_DASH1 = 3,
               O_DASH2 = 4,
               O_DASH3 = 5,
               S_DOT1 = 6,
               S_DOT2 = 7,
               S_DOT3 = 8,
               SPACE_STATE = 9;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            counter <= 0;
            state <= IDLE;
            morse_out <= 0;
        end else begin
            case (state)
                IDLE: begin
                    case (select)
                        2'b00: state <= A_DOT;  // A
                        2'b01: state <= O_DASH1; // O
                        2'b10: state <= S_DOT1;  // S
                        default: state <= IDLE;
                    endcase
                    counter <= 0;
                    morse_out <= 0;
                end
                A_DOT: begin
                    morse_out <= 1;
                    if (counter < DOT) begin
                        counter <= counter + 1;
                    end else begin
                        counter <= 0;
                        state <= SPACE_STATE;
                    end
                end
                A_DASH: begin
                    morse_out <= 1;
                    if (counter < DASH) begin
                        counter <= counter + 1;
                    end else begin
                        counter <= 0;
                        state <= IDLE;
                        morse_out <= 0;
                    end
                end
                O_DASH1, O_DASH2, O_DASH3: begin
                    morse_out <= 1;
                    if (counter < DASH) begin
                        counter <= counter + 1;
                    end else begin
                        state <= IDLE;
                        counter <= 0;
                        morse_out <= 0;
                    end
                end
                S_DOT1, S_DOT2, S_DOT3: begin
                    morse_out <= 1;
                    if (counter < DOT) begin
                        counter <= counter + 1;
                    end else if (state == S_DOT1) begin
                        state <= S_DOT2;
                        counter <= 0;
                    end else if (state == S_DOT2) begin
                        state <= S_DOT3;
                        counter <= 0;
                    end else begin
                        state <= IDLE;
                        counter <= 0;
                        morse_out <= 0;
                    end
                end
                SPACE_STATE: begin
                    morse_out <= 0;
                    if (counter < SPACE) begin
                        counter <= counter + 1;
                    end else begin
                        counter <= 0;
                        if (state == A_DOT) state <= A_DASH;
                        else state <= IDLE;
                    end
                end
            endcase
        end
    end
endmodule