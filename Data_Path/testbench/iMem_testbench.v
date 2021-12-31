`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2021 03:59:31 PM
// Design Name: 
// Module Name: iMem_testbench
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


module iMem_testbench(

    );
	
    reg [63:0] Address;
	wire [31:0] ReadData1;
	
	
	Instruction_Memory imem(Address, ReadData1);
	
	initial
	begin
	#0 Address= 64'b0;
	#50 Address = 64'b1;
	#50 Address = 64'b10;
	#50 Address = 64'b11;
	
	
	#200 $finish;
	end
endmodule
