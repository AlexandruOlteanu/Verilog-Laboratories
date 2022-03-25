`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:06:52 03/25/2022 
// Design Name: 
// Module Name:    demux_flux_date 
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
module demux_flux_date (input E, input s1, input s2, output i1, output i2, output i3, output i4);

assign i1 = (~s2 & ~s1 & E);
assign i2 = (~s2 & s1 & E);
assign i3 = (s2 & ~s1 & E);
assign i4 = (s2 & s1 & E);


endmodule
