`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:36:20 03/25/2022 
// Design Name: 
// Module Name:    xor_procedural 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module xor_procedural(input a, input b, output reg c);

always @(*)
	begin
		c = (a ^ b);
	end

endmodule
