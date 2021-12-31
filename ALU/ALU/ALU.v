`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2021 01:50:00 PM
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [3:0] A,
    input [3:0] B,
    input [3:0]OPCODE,
    input Cin,
    output reg [3:0] Y,
    output reg N,
    output Z,
    output C,
    output V
    );
    reg Cout;
    reg [4:0] temp_add;
    initial 
    begin
        Y = 4'b0000;
        Cout = 1'b0;
        N = 1'b0;
    end
    
    always @(*) begin
        Cout = 1'b0;
        case(OPCODE)
            4'b0001: Y <= A & B;
            4'b0010: Y <= A | B;
            4'b0011: Y <= ~A;
            4'b0100: Y <= A ^ B;
            4'b0101: Y <= A << B;
            4'b0110: 
            begin
            Y <= $signed(A) >>> B;
            N <= (Y[3] == 1) ? 1 : 0;
            end
            4'b0111: Y <= A >> B;
            4'b1000: 
            begin
            temp_add = A + B + Cin;
            Y <= temp_add[3:0];
            Cout <= temp_add[4];
            end
            4'b1001: 
            begin
            Y <= A - B;
            N <= (Y[3] == 1) ? 1 : 0;
            end
            default: Y <= 4'b0000;
            
        endcase   
    end 
    
    assign C = (Cout == 1) ? 1 : 0;
    assign Z = (Y == 0 && C != 1) ? 1 : 0;
    assign V = (Y[3] != Cout && Cout != 0) ? 1 : 0;
    
    
endmodule
