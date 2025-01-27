`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/09/2025 05:10:54 PM
// Design Name: 
// Module Name: digit_selector
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


module digit_selector(
	input [3:0] anodes,
	input [3:0] thousands,
	input [3:0] hundreds,
	input [3:0] tens,
	input [3:0] units,	
	output[3:0] digit
    );
 
	assign digit = (anodes[0] ? units : (anodes[1] ? tens : (anodes[2] ? hundreds : (anodes[3] ? thousands : 4'd0))));
   //assign digit = units; 
endmodule
