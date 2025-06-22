`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.03.2024 06:17:43
// Design Name: 
// Module Name: AlwaysError
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

module top20(
    input wire clk,
    output reg out
);

reg flag = 1'b1;

always @*
begin
    while (flag) begin
        out <= ~out;
    end
end

endmodule

