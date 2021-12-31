`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2021 03:34:41 PM
// Design Name: 
// Module Name: pc_testbench
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


module pc_testbench(

    );
    reg clk, rst, zero_flag;
    reg [63:0] extended_shifted;
    reg [10:0] opcode;
    wire [63:0] pc;
    
    PC_Counter program_counter(clk, rst, zero_flag, extended_shifted, opcode, pc);
    
    initial begin
        clk <= 0;
        rst <= 1;
        opcode <= 11'h0;
        extended_shifted = 64'h0;
        
        #10
        rst = 0;
        zero_flag = 1'b1;
        
        #10 extended_shifted = 64'h05730;
        #10 extended_shifted = 64'h05730;
        
        #10
        opcode = 11'h0A0;
        extended_shifted =  64'h05730;
        
        #20
        opcode = 11'h5A0;
        extended_shifted = 64'h32;
        
        #20
        zero_flag = 1'b0;
        
        #50
        rst = 1;
        
    end
    
    always begin 
        #5 clk = ~clk;
    end
    
endmodule