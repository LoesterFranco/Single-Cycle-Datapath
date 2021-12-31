module Data_Mem(Address, WriteData, WriteEnable, ReadEnable, ReadData, clk, rst);

    parameter BITSIZE = 64;
    parameter MEMSIZE = 64;
    input [$clog2(MEMSIZE)-1:0] Address;
    input [BITSIZE-1:0] WriteData;
    input WriteEnable, ReadEnable;
    output reg [BITSIZE-1:0] ReadData;
    input clk, rst;

    reg [BITSIZE-1:0] data_mem [MEMSIZE-1:0]; // Entire list of registers

    integer i; // Used below to rst all registers



    // Write back to register file on clk edge.
    always @(posedge clk)
    begin
        if (rst)
            for (i=0; i<MEMSIZE; i=i+1) data_mem[i] <= 'b0; // rst all registers

        else
            begin
                if (WriteEnable && Address != 63)
                    data_mem[Address] <= WriteData; //If writeback is enabled and not 0 register.
            end
    end
    always @(*) begin
        if (ReadEnable && Address != 63)
            ReadData = data_mem[Address];
    end

endmodule
