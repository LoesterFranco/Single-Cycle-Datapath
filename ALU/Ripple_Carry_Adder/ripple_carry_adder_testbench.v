`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2021 02:06:22 PM
// Design Name: 
// Module Name: ripple_carry_adder_testbench
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


module ripple_carry_adder_testbench(

    );
    
    reg[7:0] A, B;
    reg C0;
    wire[7:0] Sum;
    wire Cout;
    
    ripple_carry_adder rip(.A(A), .B(B), .C0(C0), .Cout(Cout), .Sum(Sum));
    
    initial
    begin
        A = 8'b00000000;
        B = 8'b00000000;
        C0 = 1'b0;
        
        #20 A = 8'b10010110;
        #10 B = 8'b01110001;
        #20 C0 = 1'b1;
        
        #10 A = 8'b01010100;
        #20 B = 8'b00110101;
        #30 C0 = 1'b0;
        
        #10 A = 8'b00000000;
        #20 B = 8'b00100100;
        
        #200 $finish;        
    
    end
endmodule
