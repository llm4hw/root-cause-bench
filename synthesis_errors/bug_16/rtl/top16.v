`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.03.2024 03:14:38
// Design Name: 
// Module Name: BlockingError
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


module top16(
    input wire clk,
    input wire rst,
    output reg out1
);

    reg data;

    always @(posedge clk or posedge rst)
    begin
        if (rst)
            data <= 1'b0;
        else
            data = ~data;
        out1 = data;
    end

//    assign out1 = data;

endmodule
