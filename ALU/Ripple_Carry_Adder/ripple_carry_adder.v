`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2021 01:38:43 PM
// Design Name: 
// Module Name: ripple_carry_adder
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


module ripple_carry_adder(
    input C0,
    input [7:0] A,
    input [7:0] B,
    output Cout,
    output [7:0] Sum
    );
    
    wire c1, c2, c3, c4, c5, c6, c7;
        
    Full_Adder_Gate fa0(.A(A[0]), .B(B[0]), .Cin(C0), .Sum(Sum[0]), .Cout(c1));
    Full_Adder_Gate fa1(.A(A[1]), .B(B[1]), .Cin(c1), .Sum(Sum[1]), .Cout(c2));
    Full_Adder_Gate fa2(.A(A[2]), .B(B[2]), .Cin(c2), .Sum(Sum[2]), .Cout(c3));
    Full_Adder_Gate fa3(.A(A[3]), .B(B[3]), .Cin(c3), .Sum(Sum[3]), .Cout(c4));
    Full_Adder_Gate fa4(.A(A[4]), .B(B[4]), .Cin(c4), .Sum(Sum[4]), .Cout(c5));
    Full_Adder_Gate fa5(.A(A[5]), .B(B[5]), .Cin(c5), .Sum(Sum[5]), .Cout(c6));
    Full_Adder_Gate fa6(.A(A[6]), .B(B[6]), .Cin(c6), .Sum(Sum[6]), .Cout(c7));
    Full_Adder_Gate fa7(.A(A[7]), .B(B[7]), .Cin(c7), .Sum(Sum[7]), .Cout(Cout));
    
    
    
endmodule
