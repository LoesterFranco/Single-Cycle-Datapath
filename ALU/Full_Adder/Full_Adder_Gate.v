`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/23/2021 03:14:07 PM
// Design Name: 
// Module Name: Full_Adder_Gate
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


module Full_Adder_Gate(
    input A,
    input B,
    input Cin,
    output Sum,
    output Cout
    );
    
    wire w1, w2, w3;
    
    and AND1(w1,A, B);
    and AND2(w2,A, Cin);
    and AND3(w3,B, Cin);
    
    or OR1(Cout, w1, w2, w3);
    xor XOR1(Sum, A, B, Cin);
    
endmodule
