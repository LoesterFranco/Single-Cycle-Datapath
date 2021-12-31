`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2021 09:12:23 PM
// Design Name: 
// Module Name: MUX
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


module MUX(
    input [63:0] data,
    input [63:0] immed,
    input flag,
    output reg [63:0] out
);

    always@(data, immed, flag)begin
        if (flag==0)
            out <= data;
        else
            out <=immed;
    end
endmodule