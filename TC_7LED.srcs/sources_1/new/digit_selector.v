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
	input [1:0] address,
	input [3:0] thousands,
	input [3:0] hundreds,
	input [3:0] tens,
	input [3:0] units,	
	output reg [3:0] digit
    );
 
    always@(*)
    	case(address)
    		2'b00: digit = units;
    		2'b01: digit = tens;
    		2'b10: digit = hundreds;
    		2'b11: digit = thousands;
    	endcase
    	 
endmodule
