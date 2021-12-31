`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2021 10:16:31 PM
// Design Name: 
// Module Name: Data_Mem_testbench
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


module Data_Mem_testbench(

    );
    
    reg [5:0] Address;
    reg [63:0] WriteData;
    reg WriteEnable, ReadEnable;
    reg clk, rst;
    wire [63:0] ReadData;


    initial
    begin
        Address=6'b0;
        WriteData=64'b0;
        WriteEnable=1'b0;
        ReadEnable=1'b0;
        clk=0;
        rst=1'b0;
    end

    always #1 clk = ~clk;
    
    Data_Mem data_mem(.Address(Address), .WriteData(WriteData), .WriteEnable(WriteEnable), .ReadEnable(ReadEnable), .ReadData(ReadData), .clk(clk), .rst(rst));

    initial
    begin
    #5 Address = 5'b00000;
    #5 WriteData = 64'b1;
    #5 WriteEnable = 1'b1;
    #5 WriteEnable = 1'b0;
    #5 ReadEnable = 1'b1;
    #5 ReadEnable = 1'b0;
    
    #5 Address = 5'b00001;
    #5 WriteData = 64'b10;
    #5 WriteEnable = 1'b1;
    #5 WriteEnable = 1'b0;
    #5 ReadEnable = 1'b1;
    #5 ReadEnable = 1'b0;
    
    #5 Address = 5'b00010;
    #5 WriteData = 64'b11;
    #5 WriteEnable = 1'b1;
    #5 WriteEnable = 1'b0;
    #5 ReadEnable = 1'b1;
    #5 ReadEnable = 1'b0;
    
    #10 Address = 5'b00000;
    #5 ReadEnable = 1'b1;
    #5 ReadEnable = 1'b0;
    
    #5 Address = 5'b00010;
    #5 ReadEnable = 1'b1;
    #5 ReadEnable = 1'b0;
    
    #10 rst=1;
    #10 rst=0;ReadEnable = 1'b1;
    
    
    
    #300 $finish;
    
    end
endmodule
