`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2021 07:09:59 PM
// Design Name: 
// Module Name: carry_select_testbench
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


module carry_select_testbench(

    );
    
    reg[7:0] A, B;
    reg Cin;
    wire[7:0] Sum;
    
    Carry_Select csa(.A(A), .B(B), .Cin(Cin), .Sum(Sum));
    
    initial
    begin
        A = 8'b00000000;
        B = 8'b00000000;
        Cin = 1'b0;
        
        #20 A = 8'b10010110;
        #10 B = 8'b01110001;
        #20 Cin = 1'b1;
        
        #10 A = 8'b01010100;
        #20 B = 8'b00110101;
        #30 Cin = 1'b0;
        
        #10 A = 8'b00000000;
        #20 B = 8'b00100100;
        
        #200 $finish;        
    
    end
endmodule
