`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2021 04:35:43 PM
// Design Name: 
// Module Name: reg_file_testbench
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


module reg_file_testbench(

);
    reg [4:0] ReadSelect1, ReadSelect2, WriteSelect;
    reg [63:0] WriteData;
    reg WriteEnable;
    reg clk, rst;
    wire [63:0] ReadData1, ReadData2;


    initial
    begin
        ReadSelect1=5'b0;
        ReadSelect2=5'b0;
        WriteSelect=5'b0;
        WriteData=64'b0;
        WriteEnable=1'b0;
        clk=0;
        rst=1'b0;
    end

    always #1 clk = ~clk;
    Register_File Reg_file(.ReadSelect1(ReadSelect1), .ReadSelect2(ReadSelect2), .WriteSelect(WriteSelect), .WriteData(WriteData), .WriteEnable(WriteEnable), .ReadData1(ReadData1), .ReadData2(ReadData2), .clk(clk), .rst(rst));

    initial
    begin
        #5 WriteSelect = 5'b00000;
        #5 WriteData = 64'b1;
        #5 WriteEnable = 1'b1;
        #5 WriteEnable = 1'b0;
        #5 WriteSelect = 5'b0001; 
        #5 WriteData = 64'b10;
        #5 WriteEnable = 1'b1;
        #5 WriteEnable = 1'b0;
        #5 ReadSelect1 = 5'b0; ReadSelect2 = 5'b1;
        
        #5 WriteSelect = 5'b00010;
        #5 WriteData = 64'b11;
        #5 WriteEnable = 1'b1;
        #5 WriteEnable = 1'b0;
        #5 WriteSelect = 5'b00011; 
        #5 WriteData = 64'b100;
        #5 WriteEnable = 1'b1;
        #5 WriteEnable = 1'b0;
        #5 ReadSelect1 = 5'b10; ReadSelect2 = 5'b11;
        
        #5 WriteSelect = 5'b00000;
        #5 WriteData = 64'b101;
        #5 WriteEnable = 1'b1;
        #5 WriteEnable = 1'b0;
        #5 WriteSelect = 5'b00001; 
        #5 WriteData = 64'b110;
        #5 WriteEnable = 1'b1;
        #5 WriteEnable = 1'b0;
        #5 ReadSelect1 = 5'b0; ReadSelect2 = 5'b1;
        
        #40 rst = 1;
        #10 rst =0;
        
        #5 ReadSelect1 = 5'b10; ReadSelect2 = 5'b11;
        
        #5 #5 WriteSelect = 5'b11111;
        #5 WriteData = 64'b10000000000;
        #5 WriteEnable = 1'b1;
        #5 WriteEnable = 1'b0;
        #5 WriteSelect = 5'b10001; 
        #5 WriteData = 64'b11111111111;
        #5 WriteEnable = 1'b1;
        #5 WriteEnable = 1'b0;
        #5 ReadSelect1 = 5'b11111; ReadSelect2 = 5'b1001;
        
        
        #300 $finish;
    end

endmodule
