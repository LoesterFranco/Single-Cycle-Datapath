`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2021 08:41:55 PM
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


module ALU_testbench(

    );
    reg[3:0] A, B, OPCODE;
    reg Cin;
    wire[3:0] Y;
    wire N, Z, C, V, Cout;
    
    
    ALU alu(.A(A), .B(B), .Y(Y), .N(N), .Z(Z), .C(C), .V(V), .Cout(Cout), .Cin(Cin), .OPCODE(OPCODE));
    
    initial
    begin
        A = 4'b0000;
        B = 4'b0000;
        OPCODE = 4'b0000;
        Cin = 1'b0;
        
        #5 OPCODE=4'b0001; 
        #5 A = 4'b1001;
        #5 B = 4'b0101;
        
        #10 OPCODE = 4'b0010;
        #5 A = 4'b0101;
        #5 B = 4'b0011;
        
        #10 OPCODE = 4'b0011;
        #5 A = 4'b1111;
        
        #10 OPCODE = 4'b0100;
        #5 A = 4'b1001;
        #5 B = 4'b1010;
        
        #10 OPCODE = 4'b0101;
        #5 A = 4'b0001;
        #5 B = 4'b0011;
        
        #10 OPCODE = 4'b0110;
        #5 A = 4'b1000;
        #5 B = 4'b0010;
        
        #10 A = 4'b0100;
        
        #10 OPCODE = 4'b0111;
        
        #10 OPCODE = 4'b1000;
        #5 A = 4'b0001;
        #5 B = 4'b1111;
        
        #10 OPCODE = 4'b1001;
        #5 A = 4'b1000;
        #5 B = 4'b0010;
        
        #400 $finish;        
    
    end
endmodule
