`timescale 1ns/1ps
`default_nettype none

module ring_oscillator(
    input wire enable,
    input wire ICE_CLK,
    output reg ICE_LED,
    output reg OUT
);

    wire [10:0] lut_ins;
    wire [10:0] lut_outs;

    genvar i;
    generate
        for (i = 0; i < 11; i = i + 1) begin : inverters
            not_with_delay inv (
                .in(lut_ins[i]),
                .out(lut_outs[i])
            );
        end
    endgenerate

    assign lut_ins = {lut_outs[10], lut_outs[9:0]};

    wire puf_clk = lut_outs[10];
    reg [15:0] counter = 0;

    always @(posedge puf_clk) begin
        if (enable) begin
            counter <= counter + 1;
            ICE_LED <= counter[0];
            OUT <= counter[0];
        end
    end

endmodule

module not_with_delay (
    input wire in,
    output reg out
);
    always @(*) #1 out = ~in;
endmodule