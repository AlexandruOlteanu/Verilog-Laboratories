`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:30:58 03/25/2022
// Design Name:   clk
// Module Name:   /home/student/Desktop/lab02_skel/test.v
// Project Name:  lab02_skel
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: clk
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test;

	// Inputs
	reg in;

	// Outputs
	wire o;

	// Instantiate the Unit Under Test (UUT)
	clk uut (
		.in(in), 
		.o(o)
	);

	initial begin
		// Initialize Inputs
		in = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	always begin
		#5 in = ~in;
	end
      
endmodule

