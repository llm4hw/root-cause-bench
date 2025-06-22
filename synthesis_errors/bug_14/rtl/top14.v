`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.03.2024 08:00:14
// Design Name: 
// Module Name: SemanticError
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


module top14(
    input wire clk,
    output reg out1
);
    always @(posedge clk)
    begin
        out1 <= data;
    end

endmodule