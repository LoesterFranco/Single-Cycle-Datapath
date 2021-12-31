`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/23/2021 03:25:50 PM
// Design Name: 
// Module Name: full_adder_testbench
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


module full_adder_testbench(

    );
    
    reg A, B, Cin;
    wire Sum, Cout;
    
    Full_Adder_Gate fa1(.A(A), .B(B), .Cin(Cin), .Sum(Sum), .Cout(Cout));
    
    initial
    begin
    
        A = 0;
        B = 0;
        Cin = 0;
        
        #10 Cin=1;
        #10 B=1; Cin=0;
        #10 Cin=1;
        #10 A=1;B=0; Cin=0;
        #10 Cin=1;
        #10 B=1; Cin=0;
        #10 Cin=1;
        
        #80 $finish;
    
    end
endmodule
