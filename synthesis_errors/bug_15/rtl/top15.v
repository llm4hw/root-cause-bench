`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.03.2024 02:58:49
// Design Name: 
// Module Name: ImplicitWire
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


module top15(
    input wire clk,
    input wire rst,
    output reg out1
);
    wire data;

    always @(posedge clk or posedge rst)
    begin
        if (rst)
            data <= 1'b0; // Initialize data on reset
        else
            data <= ~data;
        out1 <= data;
    end


endmodule
