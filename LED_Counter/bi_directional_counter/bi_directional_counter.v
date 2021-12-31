`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2021 02:52:26 PM
// Design Name: 
// Module Name: bi_directional_counter
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


module bi_directional_counter(
    input clk,
    input rst,
    input dir,
    input [7:0] max_num,
    input pause,
    output reg [7:0] count
);
    initial begin
        count = 8'b0;
    end

    always @(posedge clk)
    begin
        if (rst == 1)
            count <= 8'b0;
        else if (pause == 1)
            count <= count;
        else begin
            if (dir == 1) begin
                if (count < max_num)
                    count <= count + 8'b00000001;
                else if ((count == max_num)||(count > max_num))
                    count <= 8'b0;
            end
            else if (dir == 0) begin
                if (count > 8'b0)
                    count <= count - 8'b00000001;
                else if (count == 8'b0)
                    count <= max_num;
            end
        end
        if (rst == 1)
            count <= 8'b0;
    end


endmodule
