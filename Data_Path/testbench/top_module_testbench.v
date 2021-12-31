`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/13/2021 10:35:08 AM
// Design Name: 
// Module Name: top_module_testbench
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


module top_module_testbench();
    
    reg clk, rst;
    // intiialize top
    top_module top(.clk(clk), .rst(rst));
    // clock management
    initial begin
        clk = 0;
        rst = 1;
    end    
     always begin
        #3 clk = ~clk;
    end
    initial begin
        #5 rst = 0;
        #150 $finish;
    end
    
   
    
endmodule
