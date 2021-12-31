`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2021 07:56:30 PM
// Design Name: 
// Module Name: clock_divider
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


module clock_divider(
    input clk,
    input rst,
    output clock
);

    reg [16:0] count;
    reg fin;
    initial
    rst =0;

    always @(clk) begin
        while (count != 7'b1000000)
            begin
                if (count < 7'b1000000)
                    count = count + 1;
                else
                    count = -count;
            end
    end

endmodule
