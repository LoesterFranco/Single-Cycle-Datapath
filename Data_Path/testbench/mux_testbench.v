`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/16/2021 04:52:27 PM
// Design Name: 
// Module Name: mux_testbench
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


module mux_testbench(

    );
    
    reg clk,flag;
    reg[63:0] data, immed;
    
    wire [63:0] out;
    
    MUX mux(clk,data,immed,flag,out);
    
    initial begin
        clk <= 0;
        flag <= 1'b0;
        data <= 64'h0;
        immed <= 64'h0;
        
        #10 immed <= 64'hfffffffffffffff;
        #10 data <= 64'heeeeeeeeeeeeeee;
    end
    
    always begin
        #3 clk <= ~clk;
        #7 flag <= ~flag;
    end
endmodule
