`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:59:24 03/25/2022 
// Design Name: 
// Module Name:    demux_procedural 
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
module demux_procedural(input E, input s1, input s2, output reg i1, output reg i2, output reg i3, output reg i4);

always @(*)
    begin
        case ({s2, s1})
            2'b00: begin
						i1 = E;
						i2 = 0;
						i3 = 0;
						i4 = 0;
						end
            2'b01: begin
						i1 = 0;
						i2 = E;
						i3 = 0;
						i4 = 0;
						end
            2'b10: begin
						i1 = 0;
						i2 = 0;
						i3 = E;
						i4 = 0;
						end
            2'b11: begin
						i1 = 0;
						i2 = 0;
						i3 = 0;
						i4 = E;
						end
            default: i1 = 1'bx;
        endcase
    end

endmodule

