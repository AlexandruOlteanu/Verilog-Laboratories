`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:47:08 03/25/2022 
// Design Name: 
// Module Name:    demux_structural 
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
module demux_structural(input E, input s1, input s2, output i1, output i2, output i3, output i4);

wire y1;
wire y2;
wire y3;
wire y4;

and(y1, E, ~s2, ~s1);
and(y2, E, ~s2, s1);
and(y3, E, s2, ~s1);
and(y4, E, s2, s1);

or(i1, y1);
or(i2, y2);
or(i3, y3);
or(i4, y4);

endmodule
