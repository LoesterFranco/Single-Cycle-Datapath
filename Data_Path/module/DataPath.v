module DataPath(

    clk,rst,

    ins_Addr,
    ins,

    memAddr,memWriteData,memReadData,MemWrite,MemRead,

    rReadSelect1,rReadSelect2,rWriteSelect,rWriteData,rWriteEnable,rReadData1,rReadData2
);
    wire [63:0] immediate;
    wire flag_zero;
    wire [63:0] ALU_input2;
    
    wire control_mem2reg;
    wire control_ALUSrc;
    
    input clk,rst;
    
    PC_Counter pc_counter(.clk(clk), .rst(rst), .zero_flag(flag_zero), .extended(immediate), .opcode(ins[31:21]), .pc(ins_Addr));

    //ports for IMEM
    input  [31:0] ins; //instruction
    output [63:0] ins_Addr; //Instructions Address
    
    Control_Unit control_unit(.instr(ins), .reg_write(rWriteEnable), .mem_write(MemWrite), .mem_read(MemRead), .mem2reg(control_mem2reg), .ALUSrc(control_ALUSrc));
    
    //ports for Register file
    input [63:0] rReadData1, rReadData2;
    output [4:0] rReadSelect1, rReadSelect2, rWriteSelect; // Control singal for Reginster file
    output [63:0] rWriteData; // Data wrote to Register file
    output rWriteEnable; // Control singal for Reginster file
    
    MUX mux_reg(.data(rReadData2), .immed(immediate), .flag(control_ALUSrc), .out(ALU_input2));

    instr_parse instr_par(.instr(ins), .Read_data1(rReadSelect1), .Read_data2(rReadSelect2), .immediate(immediate), .writeselect(rWriteSelect));
    
    ALU alu(.opcode(ins[31:21]), .A(rReadData1), .B(ALU_input2), .out(memAddr), .zero(flag_zero));

    //ports for Data Memory
    input [63:0] memReadData; //Read data from memory
    output [63:0] memAddr; // Data memory Address 
    output [63:0] memWriteData; // Data wrote to data memory
    output  MemWrite; // control signal
    output  MemRead; // control signal
    
    MUX mux_mem(.data(memReadData), .immed(memAddr), .flag(control_mem2reg), .out(rWriteData));

endmodule