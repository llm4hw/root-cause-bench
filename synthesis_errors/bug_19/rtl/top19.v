`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.03.2024 06:00:27
// Design Name: 
// Module Name: BinaryError
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

module top19(
    input [1:0] a,
    output reg [1:0] y
);

always @*
begin
    if (a == 2'b00) begin
        y = 2'b00;
    end else if (a == 2'b01) begin
        y = 2'b01;
    end else begin
        y = 2'b2; 
    end
end

endmodule

