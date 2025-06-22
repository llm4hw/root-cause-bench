`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.03.2024 03:24:20
// Design Name: 
// Module Name: MultipleDriverError
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


module top17 (
    input wire clk,
    output reg out1
);

    reg driver1;

    always @(posedge clk)
    begin
        driver1 <= 1'b0;
        out1 <= driver1; // Output gets a value before the end of the module
    end

    always @(posedge clk)
    begin
        driver1 <= 1'b1;
    end

endmodule

