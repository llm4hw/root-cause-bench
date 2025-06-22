`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.03.2024 06:31:16
// Design Name: 
// Module Name: event_control_error
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top21(
    input wire clk,
    input wire reset,
    output reg led
);
// changing or
    always @(posedge clk or negedge reset) begin
        if (!reset == 0) begin
            led <= 1'b0;
        end else begin
            led <= 1'b1;
        end
    end
endmodule
