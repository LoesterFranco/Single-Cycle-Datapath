`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2021 07:06:19 PM
// Design Name: 
// Module Name: ALU_testbench
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


module alu_testbench(

    );
    reg [63:0] A, B;
    reg [10:0] opcode;
    
    wire [63:0] out;
    wire zero;
    
    ALU my_alu(.opcode(opcode), .A(A), .B(B), .out(out), .zero(zero));
    
    initial begin
        rst=1;
        A=0;
        B=0;
        opcode = 11'h000;
        
        #10 A = 64'hF0F0;
        #10 
        rst=0;
        B = 64'h0F0C;
        
        #10 opcode = 11'h450;
        #10 opcode = 11'h550;
        #10 opcode = 11'h458;
        #10 opcode = 11'h658;
        
        #10 
        #10 opcode = 11'h0A0;
        #10
        A = 64'hAAAA;
        B = 64'hAAAA;
        
        #10 
        #10 opcode = 11'h5A0;
        A = 64'hA050;
        B = 64'h0B0C;
     
        #10 
        #10 opcode = 11'h794;
        A = 64'hABCD;
        B = 64'h89A7;
        
        #10 opcode = 11'h7C0;
        #10 opcode = 11'h7C2;
        #10 opcode = 11'h000;


    end
    
endmodule