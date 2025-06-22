`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.03.2024 07:54:59
// Design Name: 
// Module Name: PortError
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


module ChildModule (
    input wire a,
    output wire c
);
    assign c = a;
endmodule

module top18 (
    input wire clk,
    input wire in,
    output wire out1
);
    wire x;

     ChildModule child_inst (
         .a(clk),
         .b(in),
         .c(x)
     );

    assign out1 = x;

endmodule

