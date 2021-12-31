`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2021 03:25:50 PM
// Design Name: 
// Module Name: Carry_Select
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


module Carry_Select(
    input [7:0] A,
    input [7:0] B,
    input Cin,
    output [7:0] Sum
    );
    
    wire[3:0] Sum1, Sum2;
    wire c0, c1;
    wire sel;
    
    ripple_carry_adder_four rca_low(.C0(Cin), .A(A[3:0]), .B(B[3:0]), .Cout(sel), .Sum(Sum[3:0]));
    ripple_carry_adder_four rca_high_1(.C0(0), .A(A[7:4]), .B(B[7:4]), .Cout(c0), .Sum(Sum1));
    ripple_carry_adder_four rca_high_2(.C0(1), .A(A[7:4]), .B(B[7:4]), .Cout(c1), .Sum(Sum2));
    
    
    two_to_one_mux mux1(.A(Sum1), .B(Sum2), .S(sel), .Out(Sum[7:4]));
    
    
    
endmodule

module ripple_carry_adder_four(
    input C0,
    input [3:0] A,
    input [3:0] B,
    output Cout,
    output [3:0] Sum
    );
    
    wire c1, c2, c3;
        
    Full_Adder_Gate fa0(.A(A[0]), .B(B[0]), .Cin(C0), .Sum(Sum[0]), .Cout(c1));
    Full_Adder_Gate fa1(.A(A[1]), .B(B[1]), .Cin(c1), .Sum(Sum[1]), .Cout(c2));
    Full_Adder_Gate fa2(.A(A[2]), .B(B[2]), .Cin(c2), .Sum(Sum[2]), .Cout(c3));
    Full_Adder_Gate fa3(.A(A[3]), .B(B[3]), .Cin(c3), .Sum(Sum[3]), .Cout(Cout));
    
    
    
endmodule