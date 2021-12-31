`timescale 1ns / 1ps

module top_module(
    input clk,
    input rst
    );
    
    // PC
    /*inputs*/
    reg [63:0] extended_and_shifted;
    reg [10:0] pc_opcode;
    reg zero_flag;
    /*outputs*/
    wire [63:0] pc;
    /////////////////////////////////////////
    // Instruction Memory
    /*inputs*/
    // reg [63:0] instruction_address aka pc
    /*outputs*/
    wire[31:0] instruction; 
    /////////////////////////////////////////
    // Instruction Parse
    /*inputs*/
    // instr aka instruction
    /*outputs*/
    wire [4:0] read_data_1;
    wire [4:0] read_data_2;
    // immediate: extended, shift happens in pc
    /////////////////////////////////////////
    // Control Logic
    /*inputs*/
    wire mem2reg;
    wire alu_src;
    /////////////////////////////////////////
    // instruction
    /*outputs*/
    wire reg_write;
    wire mem_write;
    wire mem_read;
    // Register File
    /*inputs*/
    // reg reg_write aka writeEnable
    // pc_opcode
    // address of registers to read so read_data_1 and
    // read_data_2
    wire[4:0] write_select;
    wire [63:0] write_data;
    /*outputs*/
    wire [63:0] data_1;
    wire [63:0] data_2;
    /////////////////////////////////////////
    // ALU 
    /*inputs*/
    // pc_opcode;
    // data_1
    // data_2
    /*outputs*/
    wire [63:0] alu_output;
    /*outputs*/
    wire [63:0] mem_out;
    
    Instruction_Memory ins_mem(.Address(pc), .ReadData1(instruction));

    Register_File registers(.clk(clk), .rst(rst), .ReadSelect1(read_data_1), .ReadSelect2(read_data_2), .WriteSelect(write_select), 
    .WriteData(write_data), .WriteEnable(reg_write), .ReadData1(data_1), .ReadData2(data_2));
    
    Data_Mem memory_file(.clk(clk), .rst(rst), .Address(alu_output), .WriteData(data_2), .WriteEnable(mem_write),
                         .ReadEnable(mem_read), .ReadData(mem_out));
 
    DataPath datapath(clk, rst, 
    pc, 
    instruction,
    alu_output,data_2,mem_out,mem_write,mem_read,
    read_data_1,read_data_2,write_select,write_data,reg_write,data_1,data_2);
    
    
endmodule