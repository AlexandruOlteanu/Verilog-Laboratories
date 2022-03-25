`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:10:44 03/25/2022 
// Design Name: 
// Module Name:    clk 
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
module clk(input in, output reg o);

initial begin
	o = 0;
end

always @(posedge in) begin
	o = ~o;
	end
	
endmodule
