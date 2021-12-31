`timescale 1ns / 1ps

module ALU(
    input [10:0] opcode,
    input [63:0] A,
    input [63:0] B,
    output reg [63:0] out,
    output reg zero
);

    reg [3:0] alu_opcode;
    
    always@(A, B, opcode) begin
        case (opcode)
            11'h0A0: alu_opcode = 4'b0101;
            11'h450: alu_opcode = 4'b0001;
            11'h458: alu_opcode = 4'b0110;
            11'h550: alu_opcode = 4'b0010;
            11'h5A0: alu_opcode = 4'b0100;
            11'h658: alu_opcode = 4'b0111;
            11'h794: alu_opcode = 4'b1000;
            11'h7C0: alu_opcode = 4'b0110;
            11'h7C2: alu_opcode = 4'b0110;
            default: alu_opcode = 4'b0000;
        endcase
        case (alu_opcode)
            4'b0001: out <= A & B;
            4'b0010: out <= A | B;
            4'b0011: out <= ~out;
            4'b0100: out <= A;
            4'b0101: out <= B;
            4'b0110: out <= A + B;
            4'b0111: out <= A - B;
            4'b1000: out <= {A[63:16],B[15:0]};
            default: out <= 4'b0000;
        endcase

        if(out == 64'b0) begin
            zero <= 1'b1;
        end
        else begin
            zero <= 1'b0;
        end
    end


endmodule
