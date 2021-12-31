`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2021 03:46:16 PM
// Design Name: 
// Module Name: two_to_one_mux
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


module two_to_one_mux(
    input[3:0] A,
    input[3:0] B,
    input S,
    output[3:0] Out
    );
        
    assign Out = (S == 1'b0) ? A : B; 
endmodule
