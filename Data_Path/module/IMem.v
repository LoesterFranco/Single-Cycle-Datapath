`timescale 1ns / 1ns
module Instruction_Memory(Address, ReadData1);

    parameter BITSIZE = 32;
    parameter REGSIZE = 64;
    input [REGSIZE-1:0] Address;
    output reg [BITSIZE-1:0] ReadData1;

    reg [BITSIZE-1:0] memory_file [0:REGSIZE-1]; // Entire list of memory

    // Asyncronous read of memory. Was not specified.
    always @(Address, memory_file[Address])
    begin
        ReadData1 = memory_file[Address];
    end

    integer i;
    //MY method of filling the memory instead of through a test bench
    initial
    begin
        i = 0;
			memory_file[i] = 32'b11110010100_0000000000000010_00000; //MOVK, [0] value = 10 // 2
			i = i+1;
			memory_file[i] = 32'b11110010100_0000000000000001_00001; //MOVK,[1] value = 01 // 1
			i = i+1;
			memory_file[i] = 32'b11110010100_0000000000000011_00010; //MOVK, [2] value = 11 // 3
			i = i+1;
			
			memory_file[i] = 32'b10001010000_00001_000000_00010_00011; //AND [3] value = 01 // 1
			i = i+1;
			memory_file[i] = 32'b10001011000_00001_000000_00010_00100; //ADO [4] value = 01 // 4
			i = i+1;
			memory_file[i] = 32'b10101010000_00000_000000_00001_00101; //ORR [5] value = 11 // 3
			i = i+1;
			memory_file[i] = 32'b10110100000_0000000000000011_00100; //CBNZ to 3 intructions later
			i = i+1;
            memory_file[i] = 32'b11110010100_0000000000000001_00110; //MOVK [6] value = 1;
			i = i+1;
			memory_file[i] = 32'b11110010100_0000000000000010_00110; //MOVK [6] value = 2;
			i = i+1;
			memory_file[i] = 32'b11110010100_0000000000000011_00110; //MOVK [6] value = 3; +++++++++
			i = i+1;
			memory_file[i] = 32'b11001011000_00001_000000_00010_00111; //SUB [7] value = 10 // 2
			i = i+1;
			memory_file[i] = 32'b00010100000_000000000000000000011; // BRANCH value to 3 intructions later
			i = i+1;
			memory_file[i] = 32'b11110010100_0000000000000001_01000; //MOVK [8] value = 1;
			i = i+1;
			memory_file[i] = 32'b11110010100_0000000000000010_01000; //MOVK [8] value = 2;
			i = i+1;
			memory_file[i] = 32'b11110010100_0000000000000011_01000; //MOVK [8] value = 3; +++++++++
			i = i+1;
	
			memory_file[i] = 32'b11111000000_00000000001_00000_00000; //STUR 2->x(2+1)
			i = i+1;
			memory_file[i] = 32'b11111000010_00000000001_00000_01001; //LUDR [9]
			i = i+1;

    end

endmodule
