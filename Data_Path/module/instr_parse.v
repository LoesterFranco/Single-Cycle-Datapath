`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2021 07:59:21 PM
// Design Name: 
// Module Name: instr_parse
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


module instr_parse(
    input [31:0] instr,
    output reg [4:0] Read_data1,
    output reg [4:0] Read_data2,
    output reg [63:0]immediate,
    output reg [4:0] writeselect
);
    always@(instr)begin
        case (instr[31:21])
            11'h0A0: begin //B-format
                if (instr[20]==1'b1)
                    immediate = 64'hFFFFFFFFFFE00000 + instr[20:0];
                else
                    immediate = instr[20:0];
                Read_data1 = instr[4:0];
                Read_data2 = 5'b0;
                writeselect = 5'b0;
            end
            11'h5A0: begin //CB-format
                if (instr[20]==1'b1)
                    immediate = 64'hFFFFFFFFFFF00000 + instr[20:5];
                else
                    immediate = instr[20:5];
                Read_data1 = instr[4:0];
                Read_data2 = 5'b0;
                writeselect = 5'b0;
            end
            (11'h794): begin // MOVK
                immediate = instr[20:5];
                Read_data1 = instr[4:0];
                Read_data2 = 5'b0;
                writeselect = instr[4:0];
            end
            
            11'h450 : begin //R-format
                Read_data1 = instr[9:5];
                Read_data2 = instr[20:16];
                immediate = 64'b0;
                writeselect = instr[4:0];
            end
            11'h658: begin //R-format
                Read_data1 = instr[9:5];
                Read_data2 = instr[20:16];
                immediate = 64'b0;
                writeselect = instr[4:0];
            end
            11'h550 : begin //R-format
                Read_data1 = instr[9:5];
                Read_data2 = instr[20:16];
                immediate = 64'b0;
                writeselect = instr[4:0];
            end
            11'h458: begin //R-format
                Read_data1 = instr[9:5];
                Read_data2 = instr[20:16];
                immediate = 64'b0;
                writeselect = instr[4:0];
            end
            11'h7C0 : begin //STUR
                if (instr[20]==1'b1)
                    immediate = 64'hFFFFFFFFFFFF8000 + instr[20:10];
                else
                    immediate = instr[20:10];
                Read_data1 = instr[9:5];
                Read_data2 = instr[4:0];
                writeselect = 5'b0;
            end
            11'h7C2 : begin //LDUR
            if (instr[20]==1'b1)
                    immediate = 64'hFFFFFFFFFFFF8000 + instr[20:10];
                else
                    immediate = instr[20:10];
                Read_data1 = instr[9:5];
                Read_data2 =  5'b0;
                writeselect = instr[4:0];
            end

        endcase
    end
endmodule