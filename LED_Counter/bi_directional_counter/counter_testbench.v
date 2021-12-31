`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2021 04:03:26 PM
// Design Name: 
// Module Name: counter_testbench
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


module counter_testbench(

);

    wire [7:0]count;
    reg clk, rst, dir, pause;
    reg [7:0] max_num;

    bi_directional_counter counter(.clk(clk), .rst(rst), .dir(dir), .max_num(max_num), .pause(pause), .count(count));

    initial
    begin
        pause = 0;
        rst = 0;
        dir = 1;
        max_num = 10; 

        #70 pause = 1;
        #20 pause = 0;
        #50 dir=0;
        #60 pause = 1;
        #20 pause = 0;
        #30 rst = 1;
        #10 rst = 0;
        #300 $finish;
    end

    always
    begin
        clk = 0; #5; clk = 1; #5;
    end
    
endmodule
