`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2021 08:12:37 PM
// Design Name: 
// Module Name: wrap_round_leds_testbech
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


module wrap_round_leds_testbech(

);

    reg clk, rst, sw0, sw1, sw2;
    reg [7:0] cnt;
    wire led0, led1, led2, led3;

    wrap_around_leds wrap_leds(.clk(clk), .rst(rst), .sw0(sw0), .sw1(sw1), .sw2(sw2), .cnt(cnt), .led0(led0), .led1(led1), .led2(led2), .led3(led3));

    initial
    begin
        clk = 0;
        rst = 0;
        sw0 = 0;
        sw1 = 0;
        sw2 = 0;
        cnt = 8'b00001010;
    end

    always #1 clk = ~clk;

    initial
    begin
        #10 sw0 = 1;
        #600 sw1=1;
        #300 sw0 =0;
        #300 sw1 = 0;
        #300 sw1 = 1;
        #750 sw2 = 1;
        #300 rst=1;
        #300 rst=0; sw2=0;
        #500 cnt=8'b00011111;
        #500 sw1=0;sw0=1;
        #5000 $finish; 
    end

endmodule
